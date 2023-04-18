//
//  MyTabBarViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 18/04/23.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "TabBar Navigation"
    }

}
