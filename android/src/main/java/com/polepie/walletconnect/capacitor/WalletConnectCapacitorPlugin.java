package com.polepie.walletconnect.capacitor;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "WalletConnectCapacitor")
public class WalletConnectCapacitorPlugin extends Plugin {

    private WalletConnectCapacitor implementation = new WalletConnectCapacitor();

    @PluginMethod
    public void connect(PluginCall call) {
       call.unimplemented("Not implemented on Android.");
    }

    @PluginMethod
    public void sign(PluginCall call) {
       call.unimplemented("Not implemented on Android.");
    }

    @PluginMethod
    public void getNetworkId(PluginCall call) {
       call.unimplemented("Not implemented on Android.");
    }

    @PluginMethod
    public void sendTransaction(PluginCall call) {
       call.unimplemented("Not implemented on Android.");
    }

    @PluginMethod
    public void sendCustomRequest(PluginCall call) {
       call.unimplemented("Not implemented on Android.");
    }

}
