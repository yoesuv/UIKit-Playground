//
//  FormResultViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 12/04/23.
//

import UIKit

class FormResultViewController: UIViewController {

    var model: RegisterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FormResultViewController # name \(model?.name)")
    }

}
