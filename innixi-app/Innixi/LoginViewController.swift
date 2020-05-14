//
//  LoginViewController.swift
//  Innixi
//
//  Created by Rahul on 30/04/20.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.attributedPlaceholder =  NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        passwordField.attributedPlaceholder =  NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])

        usernameField.delegate = self
        passwordField.delegate = self
        usernameField.setUnderLine()
        passwordField.setUnderLine()
        
    }
    

    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            Utils.setUser(name: usernameField.text ?? "")
            Utils.setLogedIn(login: true)
        }
    }
}
