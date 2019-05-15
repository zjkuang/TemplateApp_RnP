//
//  SustainableProtocol.swift
//  TemplateApp
//
//  Created by John Kuang on 2019-05-14.
//  Copyright © 2019 Zhengqian Kuang. All rights reserved.
//

import Foundation

// Any class conforming to Sustainable will be able to have
//  - save
//  - retrieve
// methods to access storage which can be, specified by storageType, Parse/RESTful server, local database, or User Defaults
// Can easily extend to other future unknown storage type without touch the classes

protocol Sustainable: Encodable, Decodable {
    
    // save class instance as JSON data according to storageType
    // asynchronous callback returns storage index (as the key for future retrieve) and error code
    func save(storageType: StorageType, onCompletion: @escaping (String?, StorageErrorInfo) -> ())
    
    // retrieve according to storageType and storage index
    // asynchronous callback returns the class instance and error code
    static func retrieve<T: Sustainable>(storageType: StorageType, type: T.Type, index: String, onCompletion: @escaping (T?, StorageErrorInfo) -> ())
}

extension Sustainable {
    
    func save(storageType: StorageType = .userDefaults, onCompletion: @escaping (String?, StorageErrorInfo) -> ()) {
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(self)
            // print(String(data: data, encoding: .utf8)!)
            
            switch storageType {
            case .parse:
                ParseModel.save(data: data) { (index, storageErrorInfo) in
                    onCompletion(index, storageErrorInfo)
                }
                
            case .restful:
                RESTfulModel.save(data: data) { (index, storageErrorInfo) in
                    onCompletion(index, storageErrorInfo)
                }
                
            case .userDefaults:
                UserDefaultsModel.save(data: data) { (index, storageErrorInfo) in
                    onCompletion(index, storageErrorInfo)
                }
                
            default:
                onCompletion(nil, .unrecognizedStorageType)
            }
        }
        catch {
            onCompletion(nil, .encodeFailure)
        }
        
    }
    
    static func retrieve<T: Sustainable>(storageType: StorageType = .userDefaults, type: T.Type, index: String, onCompletion: @escaping (T?, StorageErrorInfo) -> ()) {
        
        switch storageType {
        case .parse:
            ParseModel.retrieve(index: index) { (data, storageErrorInfo) in
                if storageErrorInfo == .noError,
                    let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let instance = try decoder.decode(T.self, from: data)
                        onCompletion(instance, .noError)
                    }
                    catch {
                        onCompletion(nil, .decodeFailure)
                    }
                }
            }
            
        case .restful:
            RESTfulModel.retrieve(index: index) { (data, storageErrorInfo) in
                if storageErrorInfo == .noError,
                    let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let instance = try decoder.decode(T.self, from: data)
                        onCompletion(instance, .noError)
                    }
                    catch {
                        onCompletion(nil, .decodeFailure)
                    }
                }
            }
            
        case .userDefaults:
            UserDefaultsModel.retrieve(index: index) { (data, storageErrorInfo) in
                if storageErrorInfo == .noError,
                    let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let instance = try decoder.decode(T.self, from: data)
                        onCompletion(instance, .noError)
                    }
                    catch {
                        onCompletion(nil, .decodeFailure)
                    }
                }
            }
            
        default:
            onCompletion(nil, .unrecognizedStorageType)
        }
    }
    
}
