# walletconnect-capacitor

You can use Swift implementation of WalletConnect directly in your Capacitor App

## Install

```bash
npm install walletconnect-capacitor
npx cap sync
```

Then add this into `/ios/App/App/Info.plist` in the `<dict>`

```
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>wc</string>
</array>
```

## API

<docgen-index>

* [`connect(...)`](#connect)
* [`getNetworkId()`](#getnetworkid)
* [`sign(...)`](#sign)
* [`sendTransaction(...)`](#sendtransaction)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### connect(...)

```typescript
connect(options: { dappName: string; dappDesc: string; dappURL: string; brigeURL: string; }) => Promise<{ value: string; }>
```

Connect action with walletConnect implementation (Only IOS)

| Param         | Type                                                                                    |
| ------------- | --------------------------------------------------------------------------------------- |
| **`options`** | <code>{ dappName: string; dappDesc: string; dappURL: string; brigeURL: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

**Since:** 1.0

--------------------


### getNetworkId()

```typescript
getNetworkId() => Promise<{ result: string; }>
```

Return network ID (Only IOS)

**Returns:** <code>Promise&lt;{ result: string; }&gt;</code>

**Since:** 1.0

--------------------


### sign(...)

```typescript
sign(options: { message: string; }) => Promise<{ signature: string; }>
```

Open wallet and ask to sign message(Only IOS)
Return signed message

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ message: string; }</code> |

**Returns:** <code>Promise&lt;{ signature: string; }&gt;</code>

--------------------


### sendTransaction(...)

```typescript
sendTransaction(options: { to: string; value: string; data: string; gas: string; }) => Promise<{ result: string; }>
```

Open wallet and ask to sign transaction (Only IOS)
Return signed transaction

| Param         | Type                                                                   |
| ------------- | ---------------------------------------------------------------------- |
| **`options`** | <code>{ to: string; value: string; data: string; gas: string; }</code> |

**Returns:** <code>Promise&lt;{ result: string; }&gt;</code>

--------------------

</docgen-api>
