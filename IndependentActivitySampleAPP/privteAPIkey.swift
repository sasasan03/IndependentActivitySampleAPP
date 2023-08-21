//
//  privteAPIkey.swift
//  IndependentActivitySampleAPP
//
//  Created by sako0602 on 2023/08/20.
//

import Foundation

struct KeyManager{
    private let keyFilePath = Bundle.main.path(forResource: "APIKey", ofType: "plist")
    
    func getKey() -> NSDictionary? {
        guard let keyFilePath = keyFilePath else {
            return nil
        }
        return NSDictionary(contentsOfFile: keyFilePath)
    }
    
    func getValue(key: String) -> AnyObject? {
        guard let keys = getKey() else {
            return nil
        }
        return keys[key]! as AnyObject
    }
}
