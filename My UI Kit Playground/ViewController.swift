//
//  ViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 20/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "UIKit Playground"
    }
    
    @IBAction func onClickForm(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HomeToRegister", sender: self)
    }
    
    @IBAction func onClickCounter(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HomeToCounter", sender: self)
    }
    
    @IBAction func onClickList(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HomeToList", sender: self)
    }
    
}

