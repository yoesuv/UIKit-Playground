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
    
    let button = UIButton(type: .custom)
    var isShowPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        
        password.isSecureTextEntry = !isShowPassword
        confirmPassword.isSecureTextEntry = true
        
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        password.rightView = button
        password.rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isShowPassword.toggle()
        password.isSecureTextEntry = !isShowPassword
        button.isSelected.toggle()
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
