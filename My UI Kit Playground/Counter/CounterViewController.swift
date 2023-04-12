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
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = "Counter"
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
        self.navigationController?.popViewController(animated: true)
    }
}
