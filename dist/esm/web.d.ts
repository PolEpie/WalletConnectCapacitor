import { WebPlugin } from '@capacitor/core';
import type { WalletConnectCapacitorPlugin } from './definitions';
export declare class WalletConnectCapacitorWeb extends WebPlugin implements WalletConnectCapacitorPlugin {
    connect(options: {
        dappName: string;
        dappDesc: string;
        dappURL: string;
        brigeURL: string;
        uriModel: String;
    }): Promise<{
        value: string;
    }>;
    getNetworkId(): Promise<{
        result: string;
    }>;
    sign(options: {
        message: string;
    }): Promise<{
        signature: string;
    }>;
    sendTransaction(options: {
        to: string;
        value: string;
        data: string;
        gas: string;
    }): Promise<{
        result: string;
    }>;
    sendCustomRequest(options: {
        method: string;
        params: string[];
    }): Promise<{
        result: string;
    }>;
}
