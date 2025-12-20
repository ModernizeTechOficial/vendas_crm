import { createContext, ReactNode, useContext, useEffect, useState } from 'react';
import { setCookie, getCookie, isDemoMode } from '@/utils/cookie-utils';

export type LayoutPosition = 'left' | 'right';

type LayoutContextType = {
    position: LayoutPosition;
    effectivePosition: LayoutPosition;
    updatePosition: (val: LayoutPosition) => void;
    saveLayoutPosition: () => void;
    isRtl: boolean;
};

const LayoutContext = createContext<LayoutContextType | undefined>(undefined);

export const LayoutProvider = ({ children }: { children: ReactNode }) => {
    const [position, setPosition] = useState<LayoutPosition>(() => {
        // Initialize with database value to prevent flash
        if (!isDemoMode()) {
            const globalSettings = (window as any).page?.props?.globalSettings;
            const storedPosition = globalSettings?.layoutDirection;

            if (storedPosition === 'left' || storedPosition === 'right') {
                return storedPosition;
            }
        }
        return 'left';
    });
    const [isRtl, setIsRtl] = useState<boolean>(false);

    useEffect(() => {
        const initializePosition = () => {
            let storedPosition: LayoutPosition | null = null;

            if (isDemoMode()) {
                // In demo mode, use cookies
                storedPosition = getCookie('layoutDirection') as LayoutPosition;
            } else {
                // In non-demo mode, get from database via global settings
                const globalSettings = (window as any).page?.props?.globalSettings;
                storedPosition = globalSettings?.layoutDirection as LayoutPosition;
            }

            if (storedPosition === 'left' || storedPosition === 'right') {
                setPosition(storedPosition);
            }
        };

        // Initialize immediately to prevent layout flash
        initializePosition();

        // Check if the document is in RTL mode
        const checkRtl = () => {
            const rtl = document.documentElement.dir === 'rtl';
            setIsRtl(rtl);
        };

        // Initial check
        checkRtl();

        // Set up a mutation observer to detect changes to the dir attribute
        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.attributeName === 'dir') {
                    checkRtl();
                }
            });
        });

        observer.observe(document.documentElement, { attributes: true });

        return () => observer.disconnect();
    }, []);

    const updatePosition = (val: LayoutPosition) => {
        setPosition(val);
    };

    const saveLayoutPosition = () => {
        const isDemo = (window as any).page?.props?.globalSettings?.is_demo || false;

        if (isDemo) {
            const setCookie = (name: string, value: string, days = 365) => {
                if (typeof document === 'undefined') return;
                const maxAge = days * 24 * 60 * 60;
                document.cookie = `${name}=${encodeURIComponent(value)};path=/;max-age=${maxAge};SameSite=Lax`;
            };
            setCookie('layoutDirection', position);
        }
    };

    // Calculate effective position based on RTL mode
    const effectivePosition: LayoutPosition = isRtl ?
        (position === 'left' ? 'right' : 'left') :
        position;

    return <LayoutContext.Provider value={{ position, effectivePosition, updatePosition,saveLayoutPosition, isRtl }}>{children}</LayoutContext.Provider>;
};

export const useLayout = () => {
    const context = useContext(LayoutContext);
    if (!context) throw new Error('useLayout must be used within LayoutProvider');
    return context;
};
