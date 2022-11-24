export interface WalletConnectCapacitorPlugin {
  /**
    * Connect action with walletConnect implementation (Only IOS)
    *
    * @since 1.0
    */
  connect(options: { dappName: string, dappDesc: string, dappURL: string, brigeURL: string }): Promise<{ value: string }>;
  
  /**
    * Return network ID (Only IOS)
    *
    * @since 1.0
    */
  getNetworkId(): Promise<{ result: string }>;

  /**
    * Open wallet and ask to sign message(Only IOS)
    * Return signed message
    */
  sign(options: { message: string }): Promise<{ signature: string }>;

  /**
    * Open wallet and ask to sign transaction (Only IOS)
    * Return signed transaction
    */
  sendTransaction(options: { to: string, value: string, data: string, gas: string }): Promise<{ result: string }>;
}
