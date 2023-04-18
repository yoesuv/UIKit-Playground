//
//  TabSettingsViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 18/04/23.
//

import UIKit

class TabSettingsViewController: UIViewController {

    @IBOutlet weak var labelSettings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSettings.text = "Settings"
    }

}
