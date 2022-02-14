//  web3swift
//
//  Created by Alex Vlasov.
//  Copyright © 2018 Alex Vlasov. All rights reserved.
//

import Foundation

//import EthereumAddress

public class KeystoreManager: AbstractKeystore {
    public var isHDKeystore: Bool = false

    public var addresses: [EthereumAddress]? {
        get {
            var toReturn = [EthereumAddress]()
            for keystore in _keystores {
                guard let key = keystore.addresses?.first else {
                    continue
                }
                if key.isValid {
                    toReturn.append(key)
                }
            }
            // for keystore in _bip32keystores {
            //     guard let allAddresses = keystore.addresses else {
            //         continue
            //     }
            //     for addr in allAddresses {
            //         if addr.isValid {
            //             toReturn.append(addr)
            //         }
            //     }
            // }
            // for keystore in _plainKeystores {
            //     guard let key = keystore.addresses?.first else {
            //         continue
            //     }
            //     if key.isValid {
            //         toReturn.append(key)
            //     }
            // }
            return toReturn
        }
    }

    public func UNSAFE_getPrivateKeyData(password: String, account: EthereumAddress) throws -> Data {
        guard let keystore = self.walletForAddress(account) else {throw AbstractKeystoreError.invalidAccountError}
                    return try keystore.UNSAFE_getPrivateKeyData(password: password, account: account)
                }

    public var path: String

		public func walletForAddress(_ address: EthereumAddress) -> AbstractKeystore? {
        for keystore in _keystores {
            guard let key = keystore.addresses?.first else {
                continue
            }
            if key == address && key.isValid {
                return keystore as AbstractKeystore?
            }
        }
        // for keystore in _bip32keystores {
        //     guard let allAddresses = keystore.addresses else {
        //         continue
        //     }
        //     for addr in allAddresses {
        //         if addr == address && addr.isValid {
        //             return keystore as AbstractKeystore?
        //         }
        //     }
        // }
        // for keystore in _plainKeystores {
        //     guard let key = keystore.addresses?.first else {
        //         continue
        //     }
        //     if key == address && key.isValid {
        //         return keystore as AbstractKeystore?
        //     }
        // }
        return nil
    }


    var _keystores: [EthereumKeystoreV3] = [EthereumKeystoreV3]()

    public var keystores: [EthereumKeystoreV3] {
        get {
            return self._keystores
        }
    }


		public init(_ keystores: [EthereumKeystoreV3]) {
        self.isHDKeystore = false
        self._keystores = keystores
        self.path = ""
    }


}