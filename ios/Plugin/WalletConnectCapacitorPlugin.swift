//
//  WalletConnectPlugin.swift
//  Wallet DMs
//
//  Created by Pol Epie on 22/11/2022.
//

import Foundation
import Capacitor
import WalletConnectSwift

@objc(WalletConnectCapacitorPlugin)
public class WalletConnectPlugin: CAPPlugin {
    var walletConnect: WalletConnect!

    var walletAccount: String {
        return walletConnect.session.walletInfo!.accounts[0]
    }
    
    private func nonceRequest() -> Request {
        return .eth_getTransactionCount(url: walletConnect.session.url, account: walletConnect.session.walletInfo!.accounts[0])
    }
    
    private func nonce(from response: Response) -> String? {
        return try? response.result(as: String.self)
    } 

    private func openWallet() -> Void {
        let url = "wc:" + walletConnect.session.url.topic + "@1"
        let deepLinkUrl = "wc://wc?uri=\(url)"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let url = URL(string: deepLinkUrl), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    
    
    @objc func connect(_ call: CAPPluginCall) {
        let dappName = call.getString("dappName") ?? "DAPP Name"
        let dappDesc = call.getString("dappDesc") ?? "DAPP Description"
        let dappURL = call.getString("dappURL") ?? "https://github.com/PolEpie/WalletConnectCapacitor"
        let bridgeURL = call.getString("brigeURL") ?? "https://j.bridge.walletconnect.org"
        
        walletConnect = WalletConnect(delegate: self)
        walletConnect.reconnectIfNeeded()
        
        let connectionUrl = walletConnect.connect(dappName: dappName, dappDesc: dappDesc, dappURL: dappURL, bridgeURL: bridgeURL)
        
        /// https://docs.walletconnect.org/mobile-linking#for-ios
        /// **NOTE**: Majority of wallets support universal links that you should normally use in production application
        /// Here deep link provided for integration with server test app only
        let deepLinkUrl = "wc://wc?uri=\(connectionUrl)"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let url = URL(string: deepLinkUrl), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                call.reject("No")
            }
        }
        
        call.resolve([:])
    }
    
    @objc func sign(_ call: CAPPluginCall) {
        let message = call.getString("message") ?? "default message"
        
        walletConnect.personal_sign(message: message,completion: { (response: Response) -> Void in
            if let error = response.error {
                call.reject(error.localizedDescription)
            }
            do {
                let result = try response.result(as: String.self)
                call.resolve(["signature":result])
            } catch {
                call.reject("Unexpected response type error: \(error)")
            }
        })
        
        openWallet()
    }
    
    @objc func getNetworkId(_ call: CAPPluginCall) {
        try? walletConnect.client.send(.eth_getNetwork(url: walletConnect.session.url)) { (response: Response) -> Void in
            if let error = response.error {
                call.reject(error.localizedDescription)
            }
            do {
                let result = try response.result(as: String.self)
                call.resolve(["result":result])
            } catch {
                call.reject("Unexpected response type error: \(error)")
            }
            
        }
    }
    
    @objc func sendTransaction(_ call: CAPPluginCall) {
        let from = self.walletAccount
        let to = call.getString("to") ?? "0x0"
        let value = call.getString("value") ?? "0x0"
        let data = call.getString("data") ?? "0x0"
        let gas = call.getString("gas") ?? "0x4c4b40"
        
        try? walletConnect.client.send(nonceRequest()) { [weak self] response in
            guard let self = self, let nonce = self.nonce(from: response) else { return }
            let transaction = Stub.transaction(from: from, to: to, data: data, nonce: nonce, value: value, gas: gas)
            try? self.walletConnect.client.eth_sendTransaction(url: response.url, transaction: transaction) { response in
                if let error = response.error {
                    call.reject(error.localizedDescription)
                }
                do {
                    let result = try response.result(as: String.self)
                    call.resolve(["result":result])
                } catch {
                    call.reject("Unexpected response type error: \(error)")
                }
            }
        }
        
        openWallet()
    }
}

extension Request {
    static func eth_getTransactionCount(url: WCURL, account: String) -> Request {
        return try! Request(url: url, method: "eth_getTransactionCount", params: [account, "latest"])
    }

    static func eth_getNetwork(url: WCURL) -> Request {
        return Request(url: url, method: "net_version")
    }
    
    static func eth_estimateGas(url: WCURL) -> Request {
        return Request(url: url, method: "eth_estimateGas")
    }
}

extension WalletConnectPlugin: WalletConnectDelegate {
    func failedToConnect() {
    }

    func didConnect() {
        self.notifyListeners("isConnected", data: ["address": walletConnect.session.walletInfo!.accounts[0]])
    }

    func didDisconnect() {
        self.notifyListeners("isDisconnected", data: [:])
    }
}

fileprivate enum Stub {
    /// https://docs.walletconnect.org/json-rpc-api-methods/ethereum#example-parameters
    static let typedData = """
{
    "types": {
        "EIP712Domain": [
            {
                "name": "name",
                "type": "string"
            },
            {
                "name": "version",
                "type": "string"
            },
            {
                "name": "chainId",
                "type": "uint256"
            },
            {
                "name": "verifyingContract",
                "type": "address"
            }
        ],
        "Person": [
            {
                "name": "name",
                "type": "string"
            },
            {
                "name": "wallet",
                "type": "address"
            }
        ],
        "Mail": [
            {
                "name": "from",
                "type": "Person"
            },
            {
                "name": "to",
                "type": "Person"
            },
            {
                "name": "contents",
                "type": "string"
            }
        ]
    },
    "primaryType": "Mail",
    "domain": {
        "name": "Ether Mail",
        "version": "1",
        "chainId": 1,
        "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC"
    },
    "message": {
        "from": {
            "name": "Cow",
            "wallet": "0xCD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826"
        },
        "to": {
            "name": "Bob",
            "wallet": "0xbBbBBBBbbBBBbbbBbbBbbbbBBbBbbbbBbBbbBBbB"
        },
        "contents": "Hello, Bob!"
    }
}
"""

    /// https://docs.walletconnect.org/json-rpc-api-methods/ethereum#example-parameters-1
    static func transaction(from: String, to : String, data: String, nonce: String, value: String, gas: String) -> Client.Transaction {
        return Client.Transaction(from: from,
                                  to: to,
                                  data: data,
                                  gas: gas,
                                  gasPrice: nil,
                                  value: value,
                                  nonce: nonce,
                                  type: nil,
                                  accessList: nil,
                                  chainId: nil,
                                  maxPriorityFeePerGas: nil,
                                  maxFeePerGas: nil)
    }

    /// https://docs.walletconnect.org/json-rpc-api-methods/ethereum#example-5
    static let data = "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f07244567"

}
