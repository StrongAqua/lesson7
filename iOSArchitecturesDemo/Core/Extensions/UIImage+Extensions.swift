//
//  UIImage+Extensions.swift
//  iOSArchitecturesDemo
//
//  Created by aprirez on 1/17/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
