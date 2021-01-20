//
//  Cache.swift
//  iOSArchitecturesDemo
//
//  Created by aprirez on 1/20/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

fileprivate class CacheRecord {

    private let data: Any
    private var date: Date
    
    let expirationPeriod: Double = 3600
    
    init(data: Any) {
        self.data = data
        self.date = Date()
    }
    
    func getData() -> Any {
        date = Date()
        return data
    }
    
    func isExpired() -> Bool {
        var expirationDate = date
        expirationDate.addTimeInterval(expirationPeriod)
        return expirationDate < Date()
    }
}

final class Cache {
    static let cache = Cache()

    private var garbageCollector: Timer?

    private init() {
        self.garbageCollector =
            Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) {
                [weak self] _ in
                guard let self = self else {return}
                let expiredKeys = self.storage.compactMap { $0.value.isExpired() ? $0.key : nil }
                for key in expiredKeys {
                    self.storage.removeValue(forKey: key)
                }
            }
    }

    private var storage: [String: CacheRecord] = [:]

    func get(key: String) -> Any? {
        guard let record = storage[key] else {return nil}
        return record.getData()
    }

    func set(key: String, data: Any) {
        storage[key] = CacheRecord(data: data)
    }

}
