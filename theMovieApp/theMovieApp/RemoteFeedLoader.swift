//
//  RemoteFeedLoader.swift
//  theMovieApp
//
//  Created by Ke Ma on 10/05/2020.
//  Copyright © 2020 kma. All rights reserved.
//

import Foundation

final public class RemoteFeedLoader {
    private var client: HTTPClient
    private var url: URL
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void = {_ in}) {
        client.get(from: url)
        
    }
}

public protocol HTTPClient {
    func get(from url: URL)
}
