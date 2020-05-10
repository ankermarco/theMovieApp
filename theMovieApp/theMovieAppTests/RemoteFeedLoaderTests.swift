//
//  RemoteFeedLoaderTests.swift
//  theMovieAppTests
//
//  Created by Ke Ma on 05/05/2020.
//  Copyright © 2020 kma. All rights reserved.
//

import XCTest
import theMovieApp

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequest_RequestURLIsNil() {
        let (_, client) = makeSUT()
        
        XCTAssertEqual(client.requestedURLs.count, 0)
    }
    
    func test_load_requestsDataFromUrl() {
        let givenUrl = URL(string: "https://a-given-url")!
        let (sut, client) = makeSUT(url: givenUrl)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [givenUrl])
    }
    
    func test_loadTwice_requestsDataFromUrlTwice() {
        let givenUrl = URL(string: "https://a-given-url")!
        let (sut, client) = makeSUT(url: givenUrl)
        
        sut.load()
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [givenUrl, givenUrl])
    }
    
    //MARK: Helper
    private func makeSUT(url: URL = URL(string: "https://a-given-url")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        
        let client = HTTPClientSpy()
        return (sut:RemoteFeedLoader(url: url, client: client), client: client)
    }
    
    class HTTPClientSpy: HTTPClient {
        var requestedURLs: [URL] = []
        
        func get(from url: URL) {
            requestedURLs.append(url)
        }
    }

}


