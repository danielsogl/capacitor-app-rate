import { WebPlugin } from '@capacitor/core';
import { AppRatePlugin } from './definitions';

export class AppRateWeb extends WebPlugin implements AppRatePlugin {
  constructor() {
    super({
      name: 'AppRate',
      platforms: ['web']
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }
}

const AppRate = new AppRateWeb();

export { AppRate };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(AppRate);
