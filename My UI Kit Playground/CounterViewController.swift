//
//  CounterViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 21/03/23.
//

import UIKit

class CounterViewController: UIViewController {

    var value: Int = 0
    @IBOutlet weak var labelCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelCounter.text = String(value)
    }
    
    @IBAction func onMinus(_ sender: UIButton) {
        value = value - 1
        labelCounter.text = String(value)
    }
    
    @IBAction func onPlus(_ sender: UIButton) {
        value = value + 1
        labelCounter.text = String(value)
    }
    
    @IBAction func onBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
