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
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        if let items = self.tabBar.items {
            items[0].title = "Home"
            items[0].image = UIImage(systemName: "house")
            items[1].title = "Gallery"
            items[1].image = UIImage(systemName: "photo.on.rectangle")
            items[2].title = "Settings"
            items[2].image = UIImage(systemName: "gear.circle")
        }
    }

}
