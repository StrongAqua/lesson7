//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 17.11.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionDetailsViewController: UIViewController {
    
    private let app: ITunesApp
    
    private let imageDownLoader = ImageDownloader()
    
    private var appDetailVersionDetailsView: AppDetailVersionDetailsView {
        return self.view as! AppDetailVersionDetailsView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailVersionDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillData()
    }
    
    private func fillData() {
        appDetailVersionDetailsView.titleLabel.text = "Changes:"
        appDetailVersionDetailsView.versionLabel.text = "Version " + (app.version ?? "(unknown)")
        appDetailVersionDetailsView.changesTextView.attributedText =
                NSAttributedString(string: app.releaseNotes ?? "- no data")
    }

}
