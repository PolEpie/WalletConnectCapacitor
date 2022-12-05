'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var core = require('@capacitor/core');

const WalletConnectCapacitor = core.registerPlugin('WalletConnectCapacitor', {
    web: () => Promise.resolve().then(function () { return web; }).then(m => new m.WalletConnectCapacitorWeb()),
});

class WalletConnectCapacitorWeb extends core.WebPlugin {
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

var web = /*#__PURE__*/Object.freeze({
    __proto__: null,
    WalletConnectCapacitorWeb: WalletConnectCapacitorWeb
});

exports.WalletConnectCapacitor = WalletConnectCapacitor;
//# sourceMappingURL=plugin.cjs.js.map
