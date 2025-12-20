<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Session;
use App\Models\Setting;
use App\Models\User;

class TranslationController extends BaseController
{
    public function getTranslations($locale)
    {
        // Check if language is enabled
        // $languagesFile = resource_path('lang/language.json');
        // if (File::exists($languagesFile)) {
        //     $languages = json_decode(File::get($languagesFile), true);
        //     $languageData = collect($languages)->firstWhere('code', $locale);

        //     // If language is disabled, fallback to English
        //     if ($languageData && isset($languageData['enabled']) && $languageData['enabled'] === false) {
        //         $locale = 'en';
        //     }
        // }

        $path = resource_path("lang/{$locale}.json");

        if (!File::exists($path)) {
            $path = resource_path("lang/en.json");
            $locale = 'en';
        }

        // Always determine direction based on locale
        $direction = in_array($locale, ['ar', 'he']) ? 'right' : 'left';
        $layoutDirection = in_array($locale, ['ar', 'he']) ? 'rtl' : 'ltr';

        // Always store language preference in cookie for persistence
        Cookie::queue('app_language', $locale, 60 * 24 * 30); // 30 days
        Cookie::queue('app_direction', $layoutDirection, 60 * 24 * 30);

        // Demo mode handling
        if (config('app.is_demo') !== true) {
            if (auth()->check()) {
                // Update authenticated user's language setting
                auth()->user()->update(['lang' => $locale]);

                // Only update layoutDirection for RTL languages (ar, he)
                // Keep existing direction value for other languages
                if (in_array($locale, ['ar', 'he'])) {
                    Setting::updateOrCreate(
                        [
                            'key' => 'layoutDirection',
                            'user_id' => auth()->id()
                        ],
                        [
                            'value' => 'right'
                        ]
                    );
                }
            } else {
                // For unauthenticated users on auth pages, use superadmin's language
                $superAdmin = User::where('type', 'superadmin')->first();
                if ($superAdmin && request()->is('login', 'register', 'password/*', 'email/*')) {
                    $locale = $superAdmin->lang ?? 'en';
                    $path = resource_path("lang/{$locale}.json");

                    if (!File::exists($path)) {
                        $path = resource_path("lang/en.json");
                        $locale = 'en';
                    }

                    // Re-determine direction based on superadmin's locale
                    $direction = in_array($locale, ['ar', 'he']) ? 'right' : 'left';
                    $layoutDirection = in_array($locale, ['ar', 'he']) ? 'rtl' : 'ltr';
                }
            }
        }

        $translations = json_decode(File::get($path), true);

        // Add layout direction to the response
        $response = [
            'translations' => $translations,
            'layoutDirection' => $layoutDirection,
            'locale' => $locale
        ];

        return response()->json($response);
    }

    // Add a method to get the initial locale
    public function getInitialLocale()
    {
        $locale = null;

        // First check cookie for all users for consistency
        $cookieLang = Cookie::get('app_language');
        if ($cookieLang) {
            $locale = $cookieLang;
        } elseif (auth()->check()) {
            // For authenticated users, get from user preferences
            $locale = auth()->user()->lang ?? 'en';
        } elseif (request()->is('login', 'register', 'password/*', 'email/*')) {
            // For auth pages, get from superadmin
            $superAdmin = User::where('type', 'superadmin')->first();
            $locale = $superAdmin->lang ?? 'en';
        } else {
            $locale = 'en';
        }

        // Check if the determined locale is enabled
        $languagesFile = resource_path('lang/language.json');
        if (File::exists($languagesFile)) {
            $languages = json_decode(File::get($languagesFile), true);
            $languageData = collect($languages)->firstWhere('code', $locale);

            // If language is disabled, fallback to English
            if ($languageData && isset($languageData['enabled']) && $languageData['enabled'] === false) {
                $locale = 'en';
            }
        }

        return $locale;
    }
}
