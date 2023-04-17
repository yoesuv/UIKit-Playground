//
//  BottomLogoutViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 17/04/23.
//

import UIKit

class BottomLogoutViewController: UIViewController {
    
    var okeAction: Action?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onCancelClick(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func onOkeClick(_ sender: UIButton) {
        self.dismiss(animated: true)
        self.okeAction?()
    }
    
}
