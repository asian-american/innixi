//
//  CreateAccountController.swift
//  E4tester
//
//  Created by Rahul on 15/04/20.
//  Copyright © 2020 Felipe Castro. All rights reserved.
//

import UIKit

class CreateAccountController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var welcomeText: UILabel!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        welcomeText.text = Utils.getWelcomeText(username: Utils.getUserName())

        usernameField.attributedPlaceholder =  NSAttributedString(string: Utils.getUserName(), attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        usernameField.attributedText = NSAttributedString(string: Utils.getUserName(), attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        passwordField.attributedPlaceholder =  NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        confirmPasswordField.attributedPlaceholder =  NSAttributedString(string: "Confirm Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        usernameField.delegate = self
        passwordField.delegate = self
        confirmPasswordField.delegate = self
        usernameField.setUnderLine()
        passwordField.setUnderLine()
        confirmPasswordField.setUnderLine()
    }
    
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createAccountSegue" {
            Utils.setUser(name: usernameField.text ?? "")
            
        }
    }

    
}

extension UITextField {

    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
