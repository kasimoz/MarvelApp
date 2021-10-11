//
//  String+Extensions.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation
import CryptoKit

extension String {
    
    var md5Value: String {
        
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    func getHashFromTimeStamp(privateKey: String, publicKey: String) -> String {
        return "\(self)\(privateKey)\(publicKey)".md5Value
    }
    
}

