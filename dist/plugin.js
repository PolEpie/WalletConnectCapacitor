var capacitorWalletConnectCapacitor = (function (exports, core) {
    'use strict';

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

    Object.defineProperty(exports, '__esModule', { value: true });

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
