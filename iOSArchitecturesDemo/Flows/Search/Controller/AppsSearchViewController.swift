//
//  ViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 14.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppsSearchViewController: SearchViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchView.tableView.register(AppCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }
}

//MARK: - UITableViewDataSource
extension AppsSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? AppCell else {
            return dequeuedCell
        }
        let app = self.searchResults[indexPath.row]
        let cellModel = AppCellModelFactory.cellModel(from: app as! ITunesApp)
        cell.configure(with: cellModel)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension AppsSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let object = searchResults[indexPath.row]
        guard let app = object as? ITunesApp else {return}
        let appDetailsViewController = AppDetailViewController(app: app)
        appDetailsViewController.app = app

        presenter.viewDidSelect(object: app)
    }
}

//MARK: - UISearchBarDelegate
extension AppsSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        
        presenter.viewDidSearch(with: query)
    }
    
    private func requestApps(with query: String) {
        self.throbber(show: true)
        self.searchResults = []
        self.searchView.tableView.reloadData()
        
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.searchResults = []
                        self.showNoResults()
                        return
                    }
                    self.hideNoResults()
                    self.searchResults = apps
                    
                    self.searchView.tableView.isHidden = false
                    self.searchView.tableView.reloadData()
                    
                    self.searchView.resignFirstResponder()
                    // self.searchBar.resignFirstResponder()
                }
                .withError {
                    self.showError(error: $0)
                }
        }
    }

}
