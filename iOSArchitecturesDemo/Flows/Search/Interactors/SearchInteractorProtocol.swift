//
//  SearchInteractorProtocol.swift
//  iOSArchitecturesDemo
//
//  Created by aprirez on 1/20/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

protocol SearchInteractorProtocol: AnyObject {
    func request(with query: String, completion: @escaping ([Any], Error?) -> Void)
}
