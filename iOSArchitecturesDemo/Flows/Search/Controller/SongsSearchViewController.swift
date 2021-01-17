//
//  ViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 14.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class SongsSearchViewController: SearchViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchView.tableView.register(SongCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }
}

//MARK: - UITableViewDataSource
extension SongsSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? SongCell else {
            return dequeuedCell
        }
        let song = self.searchResults[indexPath.row]
        let cellModel = SongCellModelFactory.cellModel(from: song as! ITunesSong)
        cell.configure(with: cellModel)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SongsSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let object = searchResults[indexPath.row]
        guard let song = object as? ITunesSong else {return}
        let songDetailsViewController = SongDetailViewController(song: song)
        songDetailsViewController.song = song

        presenter.viewDidSelect(object: song)
    }
}

//MARK: - UISearchBarDelegate
extension SongsSearchViewController: UISearchBarDelegate {
    
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
    
    private func requestSongs(with query: String) {
        self.throbber(show: true)
        self.searchResults = []
        self.searchView.tableView.reloadData()
        
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.searchResults = []
                        self.showNoResults()
                        return
                    }
                    self.hideNoResults()
                    self.searchResults = songs
                    
                    self.searchView.tableView.isHidden = false
                    self.searchView.tableView.reloadData()
                    
                    self.searchView.resignFirstResponder()
                }
                .withError {
                    self.showError(error: $0)
                }
        }
    }

}
