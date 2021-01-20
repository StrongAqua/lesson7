//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 14.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppsSearchPresenter {
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    private let searchService = ITunesSearchService()
    
    private func requestApp(with query: String) {
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }
    
    private func openDetails(for app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        
        viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func getOutput() -> SearchViewOutput {
        return self
    }
    
    func setInput(_ input: (UIViewController & SearchViewInput)) {
        viewInput = input
    }

}

extension AppsSearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        requestApp(with: query)
    }
    
    func viewDidSelect(object: Any) {
        openDetails(for: object as! ITunesApp)
    }
}
