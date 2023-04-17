//
//  DialogLogoutViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 16/04/23.
//

import UIKit

class DialogLogoutViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    var okeAction: Action?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    }

    @IBAction func onClickCancel(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func onClickOke(_ sender: UIButton) {
        self.dismiss(animated: true)
        self.okeAction?()
    }
}
