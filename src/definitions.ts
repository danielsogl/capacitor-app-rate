declare module '@capacitor/core' {
  interface PluginRegistry {
    AppRate: AppRatePlugin;
  }
}

export interface AppRatePlugin {
  setConfig(options: {
    usesUntilPrompt?: number;
    iosId?: string;
    androidId?: string;
  }): Promise<void>;
  navigateToAppStore(): Promise<void>;
  promptForRating(options: { force?: boolean }): Promise<void>;
}
