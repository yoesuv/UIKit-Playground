//
//  UIViewControllerExtension.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 04/05/26.
//

import UIKit

extension UIViewController {
    func setBackButtonTitle(_ title: String = "Back") {
        let backButton = UIBarButtonItem()
        backButton.title = title
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}