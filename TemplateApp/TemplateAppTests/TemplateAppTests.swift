//
//  TemplateAppTests.swift
//  TemplateAppTests
//
//  Created by John Kuang on 2019-05-14.
//  Copyright © 2019 Zhengqian Kuang. All rights reserved.
//

import XCTest
@testable import TemplateApp

class TemplateAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testRPCommentSustainability() {
        let rpComment = RPComment()
        rpComment.save(storageType: .userDefaults) { [rpComment] (index, storageErrorInfo) in
            if storageErrorInfo == .noError,
                let index = index {
                RPComment.retrieve(storageType: .userDefaults, type: RPComment.self, index: index, onCompletion: { (instance, storageErrorInfo) in
                    if storageErrorInfo == .noError,
                        let instance = instance {
                        XCTAssertEqual(instance.comment1, rpComment.comment1)
                        XCTAssertEqual(instance.comment2, rpComment.comment2)
                        XCTAssertEqual(instance.comment3, rpComment.comment3)
                    }
                    else {
                        XCTFail(storageErrorInfo.rawValue)
                    }
                })
            }
            else {
                XCTFail(storageErrorInfo.rawValue)
            }
        }
    }
    
    func testRPAnnotationSustainability() {
        let rpAnnotation = RPAnnotation()
        rpAnnotation.save(storageType: .userDefaults) { [rpAnnotation] (index, storageErrorInfo) in
            if storageErrorInfo == .noError,
                let index = index {
                RPAnnotation.retrieve(storageType: .userDefaults, type: RPAnnotation.self, index: index, onCompletion: { (instance, storageErrorInfo) in
                    if storageErrorInfo == .noError,
                        let instance = instance {
                        XCTAssertEqual(instance.annotation1, rpAnnotation.annotation1)
                        XCTAssertEqual(instance.annotation2, rpAnnotation.annotation2)
                        XCTAssertEqual(instance.annotation3, rpAnnotation.annotation3)
                    }
                    else {
                        XCTFail(storageErrorInfo.rawValue)
                    }
                })
            }
            else {
                XCTFail(storageErrorInfo.rawValue)
            }
        }
    }

}
