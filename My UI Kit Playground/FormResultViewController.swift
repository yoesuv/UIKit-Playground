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
        do {
            let data = try model?.encodeToString()
            if let out = data {
                print("FormResultViewController # data register \n \(out)")
            }
        } catch {
            print("FormResultViewController # error \(error)")
        }
    }

}
