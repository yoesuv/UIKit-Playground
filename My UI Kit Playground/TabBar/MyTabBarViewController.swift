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
        self.tabBar.items?[0].title = "Home"
        self.tabBar.items?[0].image = UIImage(systemName: "house")
        self.tabBar.items?[1].title = "Gallery"
        self.tabBar.items?[1].image = UIImage(systemName: "photo.on.rectangle")
        self.tabBar.items?[2].title = "Settings"
        self.tabBar.items?[2].image = UIImage(systemName: "gear.circle")
    }

}
