//
//  AppDetailListViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 13/04/23.
//

import UIKit

class AppDetailListViewController: UIViewController {
    
    var data: String?

    @IBOutlet weak var labelData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButtonNoGlass()
        
        self.navigationItem.title = "Detail List View"
        labelData.text = data ?? ""
    }

}
