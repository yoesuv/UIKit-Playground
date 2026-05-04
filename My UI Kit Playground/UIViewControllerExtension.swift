//
//  UIViewControllerExtension.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 04/05/26.
//

import UIKit

extension UIViewController {

    /// Sets the back button title for the next pushed screen.
    /// - Parameters:
    ///   - title: The back button title. Defaults to "Back".
    func setBackButtonTitle(_ title: String = "Back") {
        let backButton = UIBarButtonItem()
        backButton.title = title
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    /// Sets a custom back button without glass effect (iOS 26+).
    /// Uses leftBarButtonItem instead of backBarButtonItem because
    /// hidesSharedBackground does NOT work on backBarButtonItem.
    /// - Parameters:
    ///   - title: The back button title. Defaults to "Back".
    /// Note: This replaces the system back button, so swipe-back gesture
    /// must be re-enabled manually if needed.
    func setBackButtonNoGlass(_ title: String = "Back") {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.sizeToFit()
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let backButton = UIBarButtonItem(customView: button)
        if #available(iOS 26.0, *) {
            backButton.hidesSharedBackground = true
        }
        navigationItem.leftBarButtonItem = backButton
        navigationItem.hidesBackButton = true
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}