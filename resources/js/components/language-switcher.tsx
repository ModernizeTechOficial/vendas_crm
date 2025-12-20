import React from 'react';
import { useTranslation } from 'react-i18next';
import ReactCountryFlag from 'react-country-flag';
import { Button } from '@/components/ui/button';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuGroup,
    DropdownMenuItem,
    DropdownMenuTrigger,
    DropdownMenuSeparator,
} from '@/components/ui/dropdown-menu';
import { Globe, Plus, Settings } from 'lucide-react';
import { usePage } from '@inertiajs/react';
import { hasRole } from '@/utils/authorization';
import { CreateLanguageModal } from '@/components/create-language-modal';

interface Language {
    code: string;
    name: string;
    countryCode: string;
    enabled?: boolean;
}

// Import languages from the JSON file
import languageData from '@/../../resources/lang/language.json';

export const LanguageSwitcher: React.FC = () => {
    const { i18n } = useTranslation();
    const { auth } = usePage().props as any;
    const [showCreateModal, setShowCreateModal] = React.useState(false);
    const enabledLanguages = React.useMemo(() => 
        languageData.filter(lang => lang.enabled !== false),
        []
    );
    
    const currentLanguage = React.useMemo(() =>
        enabledLanguages.find(lang => lang.code === i18n.language) || enabledLanguages[0],
        [i18n.language, enabledLanguages]
    );

    const isAuthenticated = auth?.user;
    const userRoles = auth?.user?.roles?.map((role: any) => role.name) || [];
    const isSuperAdmin = isAuthenticated && hasRole('superadmin', userRoles);

    return (
        <DropdownMenu>
            <DropdownMenuTrigger asChild>
                <Button variant="ghost" className="flex items-center gap-2 h-8 rounded-md">
                    <Globe className="h-4 w-4" />
                    <span className="text-sm font-medium hidden md:inline-block">
                        {currentLanguage.name}
                    </span>
                    <ReactCountryFlag
                        countryCode={currentLanguage.countryCode}
                        svg
                        style={{
                            width: '1.2em',
                            height: '1.2em',
                        }}
                    />
                </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent className="w-56" align="end" forceMount>
                <DropdownMenuGroup>
                    {enabledLanguages.map((language) => (
                        <DropdownMenuItem
                            key={language.code}
                            onClick={() => i18n.changeLanguage(language.code)}
                            className="flex items-center gap-2"
                        >
                            <ReactCountryFlag
                                countryCode={language.countryCode}
                                svg
                                style={{
                                    width: '1.2em',
                                    height: '1.2em',
                                }}
                            />
                            <span>{language.name}</span>
                        </DropdownMenuItem>
                    ))}
                </DropdownMenuGroup>
                {isSuperAdmin && (
                    <>
                        <DropdownMenuSeparator />
                        <DropdownMenuItem
                            onClick={() => setShowCreateModal(true)}
                            className="justify-center text-primary font-semibold cursor-pointer"
                        >
                            <Plus className="h-4 w-4 mr-2" />
                            Create Language
                        </DropdownMenuItem>
                        <DropdownMenuItem asChild className="justify-center text-primary font-semibold cursor-pointer">
                            <a href={route('manage-language')} rel="noopener noreferrer">
                                <Settings className="h-4 w-4 mr-2" />
                                Manage Language
                            </a>
                        </DropdownMenuItem>
                    </>
                )}
            </DropdownMenuContent>
            <CreateLanguageModal
                open={showCreateModal}
                onOpenChange={setShowCreateModal}
                onSuccess={() => window.location.reload()}
            />
        </DropdownMenu>
    );
};
