//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 14.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchBuilder {
    static func buildAppsSearch() -> (UIViewController & SearchViewInput) {
        let presenter = AppsSearchPresenter()
        let viewController = AppsSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
    static func buildSongsSearch() -> (UIViewController & SearchViewInput) {
        let presenter = SongsSearchPresenter()
        let viewController = SongsSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
