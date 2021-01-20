//
//  SongsSearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by aprirez on 1/20/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

final class SongsSearchRouter: SearchRouterProtocol {
    
    weak var viewController: UIViewController?

    func openDetails(for entity: Any) {
        let song = entity as! ITunesSong
        let songDetailViewController = SongDetailViewController(song: song)
        viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }

}
