//
//  AlertViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 16/04/23.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "Alert Dialog"
    }

}
