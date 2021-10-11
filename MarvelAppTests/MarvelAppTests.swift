//
//  MarvelAppTests.swift
//  MarvelAppTests
//
//  Created by KasimOzdemir on 8.10.2021.
//

import XCTest
import Alamofire
@testable import MarvelApp

class MarvelAppTests: XCTestCase {

    internal let baseUrl = "https://gateway.marvel.com/v1/"
    internal let characters = "public/characters"
    internal let comics = "/1009189/comics"
    
    internal var characterListUrl = ""
    internal var comicListUrl = ""
    
    internal let parameters: [String : Any] = [
        "ts":1,
        "apikey": "b341288a7e0a40b3e487ef4d0b4dabf6",
        "hash" : "832dccf599b1eda81012658150cbd326",
        "limit" : 30,
        "offset" : 0
        
    ]
    
    internal let parameters2: [String : Any] = [
        "ts":1,
        "apikey": "b341288a7e0a40b3e487ef4d0b4dabf6",
        "hash" : "832dccf599b1eda81012658150cbd326",
        "limit" : 10,
        "dateRange":"2005-01-01,2021-10-10"
        
    ]
    
    


    override func setUpWithError() throws {
        characterListUrl = baseUrl.appending(characters)
        comicListUrl = baseUrl.appending(characters).appending(comics)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterListExample() throws {
        let e = expectation(description: "Alamofire")

        Alamofire.request(characterListUrl, method: .get, parameters: parameters, encoding: URLEncoding.default)
                .responseString { response in
                XCTAssertNil(response.error, "Whoops, error \(response.error!.localizedDescription)")

                XCTAssertNotNil(response, "No response")
                    
                XCTAssertEqual(response.response?.statusCode ?? 0, 200, "Status code not 200")
                    
                XCTAssertNotEqual(response.response?.statusCode ?? 0, 200,"StringCharacters:\(response.result.value ?? "")")
                    
                e.fulfill()
                
               
             }

            waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testComicListExample() throws {
        let e = expectation(description: "Alamofire")

        Alamofire.request(comicListUrl, method: .get, parameters: parameters2, encoding: URLEncoding.default)
                .responseString { response in
                XCTAssertNil(response.error, "Whoops, error \(response.error!.localizedDescription)")

                XCTAssertNotNil(response, "No response")
                    
                XCTAssertEqual(response.response?.statusCode ?? 0, 200, "Status code not 200")
                    
                XCTAssertNotEqual(response.response?.statusCode ?? 0, 200,"StringComics:\(response.result.value ?? "")")
                    
                e.fulfill()
                
               
             }

            waitForExpectations(timeout: 5.0, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
