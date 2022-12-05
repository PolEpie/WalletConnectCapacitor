import { WebPlugin } from '@capacitor/core';
export class WalletConnectCapacitorWeb extends WebPlugin {
    async connect(options) {
        console.log(options);
        throw this.unimplemented('Not implemented on web.');
    }
    async getNetworkId() {
        throw this.unimplemented('Not implemented on web.');
    }
    async sign(options) {
        console.log(options);
        throw this.unimplemented('Not implemented on web.');
    }
    async sendTransaction(options) {
        console.log(options);
        throw this.unimplemented('Not implemented on web.');
    }
    async sendCustomRequest(options) {
        console.log(options);
        throw this.unimplemented('Not implemented on web.');
    }
}
//# sourceMappingURL=web.js.map