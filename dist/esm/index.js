import { registerPlugin } from '@capacitor/core';
const WalletConnectCapacitor = registerPlugin('WalletConnectCapacitor', {
    web: () => import('./web').then(m => new m.WalletConnectCapacitorWeb()),
});
export * from './definitions';
export { WalletConnectCapacitor };
//# sourceMappingURL=index.js.map