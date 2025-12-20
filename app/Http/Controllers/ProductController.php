<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Tax;
use App\Services\StorageConfigService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $query = Product::query()
            ->with(['category', 'brand', 'tax', 'assignedUser', 'media'])
            ->where(function($q) {
                if (auth()->user()->type === 'company') {
                    $q->where('created_by', createdBy());
                } else {
                    $q->where('assigned_to', auth()->id());
                }
            });

        // Handle search
        if ($request->has('search') && !empty($request->search)) {
            $query->where(function ($q) use ($request) {
                $q->where('name', 'like', '%' . $request->search . '%')
                    ->orWhere('sku', 'like', '%' . $request->search . '%')
                    ->orWhere('description', 'like', '%' . $request->search . '%');
            });
        }

        // Handle category filter
        if ($request->has('category') && !empty($request->category) && $request->category !== 'all') {
            $query->where('category_id', $request->category);
        }

        // Handle brand filter
        if ($request->has('brand') && !empty($request->brand) && $request->brand !== 'all') {
            $query->where('brand_id', $request->brand);
        }

        // Handle status filter
        if ($request->has('status') && !empty($request->status) && $request->status !== 'all') {
            $query->where('status', $request->status);
        }

        // Handle assigned_to filter
        if ($request->has('assigned_to') && !empty($request->assigned_to) && $request->assigned_to !== 'all') {
            $query->where('assigned_to', $request->assigned_to);
        }

        // Handle sorting
        if ($request->has('sort_field') && !empty($request->sort_field)) {
            $query->orderBy($request->sort_field, $request->sort_direction ?? 'asc');
        } else {
            $query->orderBy('id', 'desc');
        }

        $products = $query->paginate($request->per_page ?? 10);

        // Get dropdown data
        $categories = Category::where('created_by', createdBy())
            ->where('status', 'active')
            ->get(['id', 'name']);
        
        $brands = Brand::where('created_by', createdBy())
            ->where('status', 'active')
            ->get(['id', 'name']);
        
        $taxes = Tax::where('created_by', createdBy())
            ->where('status', 'active')
            ->get(['id', 'name', 'rate']);

        // Get users for assignment dropdown (only for company users)
        $users = [];
        if (auth()->user()->type === 'company') {
            $users = \App\Models\User::where('created_by', createdBy())
                ->select('id', 'name', 'email')
                ->get();
        }

        return Inertia::render('products/index', [
            'products' => $products,
            'categories' => $categories,
            'brands' => $brands,
            'taxes' => $taxes,
            'users' => $users,
            'filters' => $request->all(['search', 'category', 'brand', 'status', 'assigned_to', 'sort_field', 'sort_direction', 'per_page']),
        ]);
    }

    public function create()
    {
        $categories = Category::where('created_by', createdBy())
            ->where('status', 'active')
            ->get(['id', 'name']);
        
        $brands = Brand::where('created_by', createdBy())
            ->where('status', 'active')
            ->get(['id', 'name']);
        
        $taxes = Tax::where('created_by', createdBy())
            ->where('status', 'active')
            ->get(['id', 'name', 'rate']);

        $users = [];
        if (auth()->user()->type === 'company') {
            $users = \App\Models\User::where('created_by', createdBy())
                ->select('id', 'name', 'email')
                ->get();
        }

        return Inertia::render('products/create', [
            'categories' => $categories,
            'brands' => $brands,
            'taxes' => $taxes,
            'users' => $users
        ]);
    }

    public function show($id)
    {
        $product = Product::with(['category', 'brand', 'tax', 'assignedUser', 'creator', 'media'])
            ->where('created_by', createdBy())
            ->findOrFail($id);

        return Inertia::render('products/show', [
            'product' => $product,
            'mainImage' => $product->main_image_url,
            'additionalImages' => $product->additional_image_urls
        ]);
    }

    public function edit($id)
    {
        $product = Product::with(['category', 'brand', 'tax', 'assignedUser', 'creator', 'media'])
            ->where('created_by', createdBy())
            ->findOrFail($id);

        $categories = Category::where('created_by', createdBy())
            ->where('status', 'active')
            ->get(['id', 'name']);
        
        $brands = Brand::where('created_by', createdBy())
            ->where('status', 'active')
            ->get(['id', 'name']);
        
        $taxes = Tax::where('created_by', createdBy())
            ->where('status', 'active')
            ->get(['id', 'name', 'rate']);

        $users = [];
        if (auth()->user()->type === 'company') {
            $users = \App\Models\User::where('created_by', createdBy())
                ->select('id', 'name', 'email')
                ->get();
        }

        return Inertia::render('products/edit', [
            'product' => array_merge($product->toArray(), [
                'main_image_id' => $product->main_image_id,
                'additional_image_ids' => $product->additional_image_ids ?: []
            ]),
            'categories' => $categories,
            'brands' => $brands,
            'taxes' => $taxes,
            'users' => $users,
            'mainImage' => $product->main_image_url,
            'additionalImages' => $product->additional_image_urls
        ]);
    }

    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'sku' => 'required|string|max:255|unique:products,sku',
                'description' => 'nullable|string',
                'price' => 'required|numeric|min:0',
                'stock_quantity' => 'nullable|integer|min:0',
                'image' => 'nullable|string',
                'main_image_id' => 'nullable|exists:media,id',
                'additional_image_ids' => 'nullable|array',
                'additional_image_ids.*' => 'exists:media,id',
                'category_id' => 'nullable|exists:categories,id',
                'brand_id' => 'nullable|exists:brands,id',
                'tax_id' => 'nullable|exists:taxes,id',
                'status' => 'nullable|in:active,inactive',
                'assigned_to' => 'nullable|exists:users,id',
            ]);

            $validated['created_by'] = createdBy();
            $validated['status'] = $validated['status'] ?? 'active';
            $validated['stock_quantity'] = $validated['stock_quantity'] ?? 0;

            if (auth()->user()->type != 'company') {
                $validated['assigned_to'] = auth()->id();
            }

            $product = Product::create($validated);

            return redirect()->route('products.index')->with('success', __('Product created successfully.'));
        } catch (\Exception $e) {
            return redirect()->back()->with('error', __('Failed to create product: :error', ['error' => $e->getMessage()]));
        }
    }

    public function update(Request $request, $productId)
    {
        $product = Product::where('id', $productId)
            ->where('created_by', createdBy())
            ->first();

        if ($product) {
            try {
                $validated = $request->validate([
                    'name' => 'required|string|max:255',
                    'sku' => 'required|string|max:255|unique:products,sku,' . $productId,
                    'description' => 'nullable|string',
                    'price' => 'required|numeric|min:0',
                    'stock_quantity' => 'nullable|integer|min:0',
                    'image' => 'nullable|string',
                    'main_image_id' => 'nullable|exists:media,id',
                    'additional_image_ids' => 'nullable|array',
                    'additional_image_ids.*' => 'exists:media,id',
                    'category_id' => 'nullable|exists:categories,id',
                    'brand_id' => 'nullable|exists:brands,id',
                    'tax_id' => 'nullable|exists:taxes,id',
                    'status' => 'nullable|in:active,inactive',
                    'assigned_to' => 'nullable|exists:users,id',
                ]);

                if (auth()->user()->type != 'company') {
                    $validated['assigned_to'] = auth()->id();
                }
                
                $product->update($validated);

                return redirect()->back()->with('success', __('Product updated successfully.'));
            } catch (\Exception $e) {
                return redirect()->back()->with('error', $e->getMessage() ?: __('Failed to update product.'));
            }
        } else {
            return redirect()->back()->with('error', __('Product not found.'));
        }
    }

    public function destroy($productId)
    {
        $product = Product::where('id', $productId)
            ->where('created_by', createdBy())
            ->first();

        if ($product) {
            try {
                $product->delete();
                return redirect()->back()->with('success', __('Product deleted successfully.'));
            } catch (\Exception $e) {
                return redirect()->back()->with('error', $e->getMessage() ?: __('Failed to delete product.'));
            }
        } else {
            return redirect()->back()->with('error', __('Product not found.'));
        }
    }

    public function toggleStatus($productId)
    {
        $product = Product::where('id', $productId)
            ->where('created_by', createdBy())
            ->first();

        if ($product) {
            try {
                $product->status = $product->status === 'active' ? 'inactive' : 'active';
                $product->save();

                return redirect()->back()->with('success', __('Product status updated successfully.'));
            } catch (\Exception $e) {
                return redirect()->back()->with('error', $e->getMessage() ?: __('Failed to update product status.'));
            }
        } else {
            return redirect()->back()->with('error', __('Product not found.'));
        }
    }
}