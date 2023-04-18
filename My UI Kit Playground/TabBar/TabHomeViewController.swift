//
//  TabHomeViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 18/04/23.
//

import UIKit

class TabHomeViewController: UIViewController {

    @IBOutlet weak var labelHome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelHome.text = "Home"
    }

}
