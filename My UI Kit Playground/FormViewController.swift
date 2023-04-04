//
//  FormViewController.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 03/04/23.
//

import UIKit

class FormViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        
        password.enablePasswordToggle()
    }
    
    @IBAction func onBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func onRegisterPressed(_ sender: UIButton) {
        let name = fullName.text ?? ""
        let email = email.text ?? ""
        let password = password.text ?? ""
        let confirmPassword = confirmPassword.text ?? ""
        print("FormViewController # full name \(name)")
        print("FormViewController # email \(email)")
        print("FormViewController # password \(password)")
        print("FormViewController # confirm password \(confirmPassword)")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
