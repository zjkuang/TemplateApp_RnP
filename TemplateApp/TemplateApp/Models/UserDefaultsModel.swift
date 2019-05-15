//
//  UserDefaultsModel.swift
//  TemplateApp
//
//  Created by John Kuang on 2019-05-14.
//  Copyright © 2019 Zhengqian Kuang. All rights reserved.
//

import Foundation

//
// As a data model handles and hides the physical data source which may be a remote server, a local database, or the User Defaults
//

// UserDefaultsModel, specifically,
// (1) provides a local storage model via User Defaults
// (2) and also, can serve as a stub model before the back-ends for the other models are available

class UserDefaultsModel {
    
    class func save(data: Data, onCompletion: @escaping (String?, StorageErrorInfo) -> ()) {
        
        // dispatch into a work thread to do storing task
        DispatchQueue.global(qos: .userInitiated).async { [data] in
            
            // create a UUID string as storage index, which is to be returned through callback
            let uuidString = UUID().uuidString
            UserDefaults.standard.set(data, forKey: uuidString)
            
            // when finished, dispatch the callback to main thread to make UI operation safe, if any
            DispatchQueue.main.async { [uuidString] in
                onCompletion(uuidString, .noError)
            }
            
        }
    }
    
    class func retrieve(index: String, onCompletion: @escaping (Data?, StorageErrorInfo) -> ()) {
        
        // dispatch into a work thread to do retrieving task
        DispatchQueue.global(qos: .userInitiated).async { [index] in
            let data = UserDefaults.standard.data(forKey: index)
            
            // when finished, dispatch the callback to main thread to make UI operation safe, if any
            DispatchQueue.main.async { [data] in
                if let data = data {
                    onCompletion(data, .noError)
                }
                else {
                    onCompletion(nil, .retrieveFailure)
                }
            }
            
        }
    }
    
}
