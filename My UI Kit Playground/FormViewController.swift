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
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        fullName.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        
        password.enablePasswordToggle()
        confirmPassword.enableConfirmPasswordToggle()
    }
    
    @IBAction func onBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onRegisterPressed(_ sender: UIButton) {
        let name = fullName.text ?? ""
        let email = email.text ?? ""
        let password = password.text ?? ""
        let confirmPassword = confirmPassword.text ?? ""
        let model = RegisterModel(name: name, email: email, password: password, confirmPassword: confirmPassword)
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(model)
            let output = String(data: data, encoding: .utf8)
            if let out = output {
                print("FormViewController # encode \(out)")
                self.performSegue(withIdentifier: "RegisterToResult", sender: self)
            }
        } catch {
            print("FormViewController # error encode \(error)")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
