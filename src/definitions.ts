declare module "@capacitor/core" {
  interface PluginRegistry {
    AppRate: AppRatePlugin;
  }
}

export interface AppRatePlugin {
  echo(options: { value: string }): Promise<{value: string}>;
}
