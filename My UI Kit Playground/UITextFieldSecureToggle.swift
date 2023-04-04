//
//  UITextFieldSecureToggle.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 04/04/23.
//

import Foundation
import UIKit

let button = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle() {
        isSecureTextEntry = true
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = button
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        button.isSelected.toggle()
    }
}
