import { WebPlugin } from '@capacitor/core';

import type { WalletConnectCapacitorPlugin } from './definitions';

export class WalletConnectCapacitorWeb
  extends WebPlugin
  implements WalletConnectCapacitorPlugin
{
  async connect(options: { dappName: string, dappDesc: string, dappURL: string, brigeURL: string }): Promise<{ value: string }> {
    console.log(options)
    throw this.unimplemented('Not implemented on web.');
  }

  async getNetworkId(): Promise<{ result: string }> {
    throw this.unimplemented('Not implemented on web.');
  }

  async sign(options: { message: string }): Promise<{ signature: string }> {
    console.log(options)
    throw this.unimplemented('Not implemented on web.');
  }

  async sendTransaction(options: { to: string, value: string, data: string, gas: string }): Promise<{ result: string }> {
    console.log(options)
    throw this.unimplemented('Not implemented on web.');
  }
}
