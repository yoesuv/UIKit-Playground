//
//  AlertViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 16/04/23.
//

import UIKit

typealias Action = (() -> Void)

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "Alert Dialog"
    }

    @IBAction func onClickDefault(_ sender: UIButton) {
        
    }
    
    @IBAction func onClickLogour(_ sender: UIButton) {
        let logoutVC = DialogLogoutViewController.init(nibName: "DialogLogoutViewController", bundle: nil)
        logoutVC.modalPresentationStyle = .overCurrentContext
        logoutVC.modalTransitionStyle = .crossDissolve
        logoutVC.okeAction = {
            self.navigationController?.popViewController(animated: true)
        }
        self.present(logoutVC, animated: true)
    }
}
