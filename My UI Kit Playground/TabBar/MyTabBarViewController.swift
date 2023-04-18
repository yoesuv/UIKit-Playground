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
        self.tabBar.backgroundColor = UIColor(named: "Grey200")
        self.tabBar.tintColor = UIColor(named: "AccentColor")
        if let items = self.tabBar.items {
            items[0].title = "Home"
            items[0].image = UIImage(systemName: "house")?.resized(to: CGSize(width: 25, height: 20))
            items[1].title = "Gallery"
            items[1].image = UIImage(systemName: "photo.on.rectangle")?.resized(to: CGSize(width: 25, height: 20))
            items[2].title = "Settings"
            items[2].image = UIImage(systemName: "gear.circle")?.resized(to: CGSize(width: 21, height: 20))
        }
    }

}
