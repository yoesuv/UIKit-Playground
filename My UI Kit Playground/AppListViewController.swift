//
//  AppListViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 05/04/23.
//

import UIKit

class AppListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "List View"
    }

}
