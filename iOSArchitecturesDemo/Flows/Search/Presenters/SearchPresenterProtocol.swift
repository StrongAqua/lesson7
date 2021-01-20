//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 14.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: AnyObject {
    var searchResults: [Any] { get set }
    
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelect(object: Any)
}
