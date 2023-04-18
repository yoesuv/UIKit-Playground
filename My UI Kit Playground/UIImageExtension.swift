//
//  UIImageExtension.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 18/04/23.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
