//
//  Enums.swift
//  TemplateApp
//
//  Created by John Kuang on 2019-05-14.
//  Copyright © 2019 Zhengqian Kuang. All rights reserved.
//

import Foundation

enum StorageErrorInfo: String {
    case noError = "No error"
    case unrecognizedStorageType = "Unrecognized storage type"
    case encodeFailure = "Encode failure"
    case decodeFailure = "Decode failure"
    case saveFailure = "Save failure"
    case retrieveFailure = "Retrieve failure"
}

enum StorageType: String {
    case undefined = "Undefined"
    case parse = "Parse"
    case restful = "RESTful"
    case userDefaults = "User Defaults" // test stub before the remote server is available
}

