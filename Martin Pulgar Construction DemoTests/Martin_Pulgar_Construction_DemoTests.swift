//
//  Martin_Pulgar_Construction_DemoTests.swift
//  Martin Pulgar Construction DemoTests
//
//  Created by Dmitrii Zverev on 15/9/2022.
//

import XCTest
import SwiftUI
@testable import Martin_Pulgar_Construction_Demo

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}

final class Martin_Pulgar_Construction_DemoTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testApi() async {
        let serviceManager = NetworkModel()
        let promiseValidData = expectation(description: "Object from API is correct")
        do {
            let _ = try await serviceManager.postFake(FakeDataToSend.example)
            promiseValidData.fulfill()
        } catch {
            print("Error:", error)
            XCTFail(error.localizedDescription)
        }
        
        wait(for: [promiseValidData], timeout: 10)
    }
    
    
    func testBase64() {
        guard let img = UIImage(systemName: "exclamationmark.circle") else {
            XCTFail("Image does not exist")
            return
        }
        guard let base64Str = img.base64 else {
            XCTFail("base64Str fails")
            return
        }
        
        guard let newImage = base64Str.imageFromBase64 else {
            XCTFail("imageFromBase64 fails")
            return
        }
        XCTAssertTrue(newImage.size.height > 0)
    }
    
    func testApiFail() async {
        let serviceManager = NetworkModel()
        let promiseInvalidData = expectation(description: "Object from API is NOT correct")
        do {
            let _ = try await serviceManager.post(FakeDataToSend.example)
            XCTFail("Somehow the object is good")
        } catch {
            print("Error:", error)
            promiseInvalidData.fulfill()
        }
        wait(for: [promiseInvalidData], timeout: 10)
    }
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
