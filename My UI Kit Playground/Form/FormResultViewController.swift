//
//  FormResultViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 12/04/23.
//

import UIKit

class FormResultViewController: UIViewController {

    var model: RegisterModel?
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let data = try model?.encodeToString()
            if let out = data {
                print("FormResultViewController # data register \n \(out)")
            }
            labelName.text = model?.name
            labelEmail.text = model?.email
        } catch {
            print("FormResultViewController # error \(error)")
        }
    }

}
