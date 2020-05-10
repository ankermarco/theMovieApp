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
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_init_clientGetRequestedUrlFromRemoteLoader() {
        let givenUrl = URL(string: "https://a-given-url")!
        let (sut, client) = makeSUT(url: givenUrl)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURL, givenUrl)
    }
    
    //MARK: Helper
    private func makeSUT(url: URL = URL(string: "https://a-given-url")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        
        let client = HTTPClientSpy()
        return (sut:RemoteFeedLoader(url: url, client: client), client: client)
    }

}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    func setUrl(from url: URL) {
        requestedURL = url
    }
}
