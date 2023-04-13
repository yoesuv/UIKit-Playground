//
//  AppDetailListViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 13/04/23.
//

import UIKit

class AppDetailListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "Detail List View"
    }

}
