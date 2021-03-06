//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp
    
    lazy var headerViewController = AppDetailHeaderViewController(app: app)
    lazy var versionDetailsViewController = AppDetailVersionDetailsViewController(app: app)

    private let imageDownloader = ImageDownloader()
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        addChildViewController(
            controller: headerViewController,
            topAnchor: self.view.safeAreaLayoutGuide.topAnchor
        )
        addChildViewController(
            controller: versionDetailsViewController,
            topAnchor: headerViewController.view.bottomAnchor
        )
        NSLayoutConstraint.activate([
            versionDetailsViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        addDescriptionViewController()
        
    }
    
    private func addChildViewController(controller: UIViewController, topAnchor: NSLayoutYAxisAnchor) {
        self.addChild(controller)
        self.view.addSubview(controller.view)
        
        controller.didMove(toParent: self)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: topAnchor),
            controller.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            controller.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        // Дз: Добавить дочерний вью контроллер
        let vc = UIViewController()
        
        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            vc.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            vc.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            vc.view.heightAnchor.constraint(equalToConstant: 250.0)
        ])
    }
}
