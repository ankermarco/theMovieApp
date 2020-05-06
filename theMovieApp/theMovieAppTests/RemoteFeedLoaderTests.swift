//
//  RemoteFeedLoaderTests.swift
//  theMovieAppTests
//
//  Created by Ke Ma on 05/05/2020.
//  Copyright © 2020 kma. All rights reserved.
//

import XCTest

class RemoteFeedLoader {
    
}

protocol HTTPClient {
    
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequest_RequestURLIsNil() {
        _ = RemoteFeedLoader()
        let client = HTTPClientSpy()
        
        XCTAssertNil(client.requestedURL)
        
    }

}
