import { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { getBrandSettings, type BrandSettings } from '@/pages/settings/components/brand-settings';
import { getCookie, isDemoMode } from '@/utils/cookie-utils';

interface BrandContextType extends BrandSettings {
  updateBrandSettings: (settings: Partial<BrandSettings>) => void;
}

const BrandContext = createContext<BrandContextType | undefined>(undefined);

export function BrandProvider({ children, globalSettings, user }: { children: ReactNode; globalSettings?: any; user?: any }) {
  // Determine which settings to use based on user role and route
  const getEffectiveSettings = () => {
    const isPublicRoute = window.location.pathname.includes('/public/') || 
                         window.location.pathname === '/' || 
                         window.location.pathname.includes('/auth/');
    
    // For public routes (landing page, auth pages), always use superadmin settings
    if (isPublicRoute) {
      return globalSettings;
    }
    
    // For authenticated routes, use user's own settings if company role
    if (user?.role === 'company' && user?.globalSettings) {
      return user.globalSettings;
    }
    
    // Default to global settings (superadmin)
    return globalSettings;
  };
  
  const [brandSettings, setBrandSettings] = useState<BrandSettings>(() => 
    getBrandSettings(getEffectiveSettings())
  );

  // Listen for changes in settings
  useEffect(() => {
    let effectiveSettings = getEffectiveSettings();
    
    // In demo mode, also check cookies for brand settings
    if (isDemoMode()) {
      try {
        const cookieBrandSettings = getCookie('brandSettings');
        if (cookieBrandSettings) {
          const parsedCookieSettings = JSON.parse(cookieBrandSettings);
          // Merge cookie settings with effective settings
          effectiveSettings = { ...effectiveSettings, ...parsedCookieSettings };
        }
      } catch (error) {
        console.error('Error loading brand settings from cookies', error);
      }
    }
    
    const updatedSettings = getBrandSettings(effectiveSettings);
    setBrandSettings(updatedSettings);
  }, [globalSettings, user]);

  const updateBrandSettings = (newSettings: Partial<BrandSettings>) => {
    setBrandSettings(prev => ({ ...prev, ...newSettings }));
  };

  return (
    <BrandContext.Provider value={{ ...brandSettings, updateBrandSettings }}>
      {children}
    </BrandContext.Provider>
  );
}

export function useBrand() {
  const context = useContext(BrandContext);
  if (context === undefined) {
    throw new Error('useBrand must be used within a BrandProvider');
  }
  return context;
}