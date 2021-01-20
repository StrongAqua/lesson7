//
//  SongsSearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by aprirez on 1/20/21.
//  Copyright © 2021 ekireev. All rights reserved.
//
import Foundation

final class SongsSearchInteractor: SearchInteractorProtocol {
    
    private let searchService = ITunesSearchService()

    func request(with query: String, completion: @escaping ([Any], Error?) -> Void) {
        let cached = Cache.cache.get(key: "songs/" + query)
        if let cached = cached as? [Any],
           !cached.isEmpty {
            debugPrint("SongsSearchInteractor: return cached data for the query '\(query)'")
            completion(cached, nil)
        } else {
            debugPrint("SongsSearchInteractor: get data from server for the query '\(query)'")
            self.searchService.getSongs(forQuery: query) { result in
                result
                    .withValue { songs in
                        debugPrint("SongsSearchInteractor: done get data from server for the query '\(query)'")
                        Cache.cache.set(key: "songs/" + query, data: songs)
                        completion(songs, nil)
                    }
                    .withError { (error) in
                        completion([], error)
                    }
            }
        }
    }
}
