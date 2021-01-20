//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 14.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

class SongsSearchPresenter {

    let interactor: SearchInteractorProtocol
    let router: SearchRouterProtocol
    
    init(interactor: SearchInteractorProtocol, router: SearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    weak var viewInput: SearchViewInput?
    
    private let searchService = ITunesSearchService()
    
    private func requestSongs(with query: String) {
        self.interactor.request(with: query, completion: {
            [weak self] songs, error in
            guard let self = self else {return}
            
            self.viewInput?.throbber(show: false)
            if let error = error {
                self.viewInput?.showError(error: error)
            } else {
                if songs.isEmpty {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = songs
            }
        })
    }
}

extension SongsSearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        requestSongs(with: query)
    }
    
    func viewDidSelect(object: Any) {
        self.router.openDetails(for: object)
    }
}
