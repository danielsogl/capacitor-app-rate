import { WebPlugin } from '@capacitor/core';
import { AppRatePlugin } from './definitions';

export class AppRateWeb extends WebPlugin implements AppRatePlugin {
  constructor() {
    super({
      name: 'AppRate',
      platforms: ['web']
    });
  }

  async setConfig(options: {
    usesUntilPrompt?: number;
    iosId?: string;
    androidId?: string;
  }): Promise<void> {
    console.log('openAppstore', options);
    return;
  }

  async navigateToAppStore(): Promise<void> {
    console.log('navigateToAppStore');
    return;
  }

  async promptForRating(options: { force?: boolean }): Promise<void> {
    console.log('promptForRating', options);
    return;
  }
}

const AppRate = new AppRateWeb();

export { AppRate };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(AppRate);
