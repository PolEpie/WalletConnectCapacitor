import { registerPlugin } from '@capacitor/core';

import type { WalletConnectCapacitorPlugin } from './definitions';

const WalletConnectCapacitor = registerPlugin<WalletConnectCapacitorPlugin>(
  'WalletConnectCapacitor',
  {
    web: () => import('./web').then(m => new m.WalletConnectCapacitorWeb()),
  },
);

export * from './definitions';
export { WalletConnectCapacitor };
