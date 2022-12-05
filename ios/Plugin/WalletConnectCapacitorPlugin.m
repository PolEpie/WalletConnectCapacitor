#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(WalletConnectCapacitorPlugin, "WalletConnectCapacitor",
            CAP_PLUGIN_METHOD(connect, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(getNetworkId, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(sign, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(sendTransaction, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(sendCustomRequest, CAPPluginReturnPromise);
)
