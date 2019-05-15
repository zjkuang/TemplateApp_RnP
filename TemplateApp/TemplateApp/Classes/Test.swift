//
//  Test.swift
//  TemplateApp
//
//  Created by John Kuang on 2019-05-14.
//  Copyright © 2019 Zhengqian Kuang. All rights reserved.
//

import Foundation

class Test {
    
    class func test() {
        
        let rpComment = RPComment() // create an RPComment instance
        // save this instance
        for storageType: StorageType in [.userDefaults, .parse, .restful] {
            rpComment.save(storageType: storageType) { [rpComment] (index, storageErrorInfo) in
                if storageErrorInfo == .noError,
                    let index = index {
                    // if saved succesfully, retrieve the saved instance by the returned storage index
                    RPComment.retrieve(storageType: storageType, type: RPComment.self, index: index, onCompletion: { (instance, storageErrorInfo) in
                        if storageErrorInfo == .noError,
                            let instance = instance {
                            if instance.comment1 == rpComment.comment1 &&
                                instance.comment2 == rpComment.comment2 &&
                                instance.comment3 == rpComment.comment3 {
                                print("RPComment sustainability test for \(storageType.rawValue) OK!")
                            }
                            else {
                                print("RPComment sustainability test for \(storageType.rawValue) failed!")
                                print("saved: \(rpComment.comment1), \(rpComment.comment2), \(rpComment.comment3)")
                                print("retrieved: \(instance.comment1), \(instance.comment2), \(instance.comment3)")
                            }
                        }
                        else {
                            print(storageErrorInfo.rawValue)
                        }
                    })
                }
                else {
                    print(storageErrorInfo.rawValue)
                }
            }
        }
        
        let rpAnnotation = RPAnnotation() // create an RPAnnotation instance
        // save this instance
        for storageType: StorageType in [.userDefaults, .parse, .restful] {
            rpAnnotation.save(storageType: storageType) { [rpAnnotation] (index, storageErrorInfo) in
                if storageErrorInfo == .noError,
                    let index = index {
                    // if saved succesfully, retrieve the saved instance by the returned storage index
                    RPAnnotation.retrieve(storageType: storageType, type: RPAnnotation.self, index: index, onCompletion: { (instance, storageErrorInfo) in
                        if storageErrorInfo == .noError,
                            let instance = instance {
                            if instance.annotation1 == rpAnnotation.annotation1 &&
                                instance.annotation2 == rpAnnotation.annotation2 &&
                                instance.annotation3 == rpAnnotation.annotation3 {
                                print("RPAnnotation sustainability test for \(storageType.rawValue) OK!")
                            }
                            else {
                                print("RPAnnotation sustainability test for \(storageType.rawValue) failed!")
                                print("saved: \(rpAnnotation.annotation1), \(rpAnnotation.annotation2), \(rpAnnotation.annotation3)")
                                print("retrieved: \(instance.annotation1), \(instance.annotation2), \(instance.annotation3)")
                            }
                        }
                        else {
                            print(storageErrorInfo.rawValue)
                        }
                    })
                }
                else {
                    print(storageErrorInfo.rawValue)
                }
            }
        }
    }
}
