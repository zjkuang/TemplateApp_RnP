//
//  ParseModel.swift
//  TemplateApp
//
//  Created by John Kuang on 2019-05-14.
//  Copyright © 2019 Zhengqian Kuang. All rights reserved.
//

import Foundation

//
// As a data model handles and hides the physical data source which may be a remote server, a local database, or the User Defaults
//

class ParseModel {
    
    static let simulate = true
    
    class func save(data: Data, onCompletion: @escaping (String?, StorageErrorInfo) -> ()) {
        
        if simulate {
            UserDefaultsModel.save(data: data) { (index, storageErrorInfo) in
                onCompletion(index, storageErrorInfo)
            }
        }
        else { // real Parse API
            
            // call real Parse API to save the data, suppose Parse API returns the index string for future retrieve
            let index = UUID().uuidString // simulate the index returned by Parse API
            let successful = true
            
            // when finished, dispatch the callback to main thread to make UI operation safe, if any
            DispatchQueue.main.async { [index, successful] in
                if successful {
                    onCompletion(index, .noError)
                }
                else {
                    onCompletion(nil, .saveFailure)
                }
            }
        }
    }
    
    class func retrieve(index: String, onCompletion: @escaping (Data?, StorageErrorInfo) -> ()) {
        
        if simulate {
            UserDefaultsModel.retrieve(index: index) { (data, storageErrorInfo) in
                onCompletion(data, storageErrorInfo)
            }
        }
        else { // real Parse API
            
            // call real Parse API to retrieve the data
            let data = Data()
            let successful = true
            
            // when finished, dispatch the callback to main thread to make UI operation safe, if any
            DispatchQueue.main.async { [data, successful] in
                if successful {
                    onCompletion(data, .noError)
                }
                else {
                    onCompletion(nil, .retrieveFailure)
                }
            }
        }
    }
    
}
