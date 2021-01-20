//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 14.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchBuilder {

    static func buildAppsSearchController() -> UIViewController {
        let presenter = AppsSearchPresenter()
        let viewController = AppsSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }

    static func buildSongsSearchController() -> UIViewController {
        let router = SongsSearchRouter()
        let interactor = SongsSearchInteractor()
        let presenter = SongsSearchPresenter(interactor: interactor, router: router)
        let viewController = SongsSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        return viewController
    }

}
