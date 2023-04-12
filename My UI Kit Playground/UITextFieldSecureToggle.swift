//
//  UITextFieldSecureToggle.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 04/04/23.
//

import Foundation
import UIKit

let button = UIButton(type: .custom)
let button2 = UIButton(type: .custom)
let imgEye = UIImage(systemName: "eye.fill")
let imgEyeSlash = UIImage(systemName: "eye.slash.fill")

extension UITextField {
    
    // for password
    func enablePasswordToggle() {
        isSecureTextEntry = true
        button.setImage(imgEye, for: .normal)
        button.setImage(imgEyeSlash, for: .selected)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = UIColor.white
        button.configuration = config
        
        rightView = button
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        button.isSelected.toggle()
    }
    
    // for confirm password
    func enableConfirmPasswordToggle() {
        isSecureTextEntry = true
        button2.setImage(imgEye, for: .normal)
        button2.setImage(imgEyeSlash, for: .selected)
        button2.addTarget(self, action: #selector(toggleConfirmPasswordView), for: .touchUpInside)
        
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = UIColor.white
        button2.configuration = config
        
        rightView = button2
        rightViewMode = .always
    }
    
    @objc func toggleConfirmPasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        button2.isSelected.toggle()
    }
}
