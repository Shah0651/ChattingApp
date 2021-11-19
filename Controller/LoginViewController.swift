//
//  LoginViewController.swift
//  ChattingApp
//
//  Created by md asadullah on 31/05/21.
//  Copyright © 2021 droisys. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
                if let e = error {
                    self.showAlert()
                    print(e)
                }
                else {
                    // Navigate to ChatViewController
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Enter details to logIn" , message: "Make sure to enter correct details", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            print("Tapped OK")
        }))
        present(alert, animated: true)
    }
}
