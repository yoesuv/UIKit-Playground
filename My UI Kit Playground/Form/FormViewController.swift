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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "RegisterToResult") {
            let desVC = segue.destination as! FormResultViewController
            let object = sender as! RegisterModel
            desVC.model = object
        }
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
        self.performSegue(withIdentifier: "RegisterToResult", sender: model)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
