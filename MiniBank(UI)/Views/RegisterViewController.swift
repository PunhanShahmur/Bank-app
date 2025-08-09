//
//  RegisterViewController.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 09.08.25.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet private weak var fullnameInput: UITextField!
    @IBOutlet private weak var emailInput: UITextField!
    @IBOutlet private weak var phoneInput: UITextField!
    @IBOutlet private weak var passwordInput: UITextField!
    
    var userCreated: (( User ) -> Void)?  /// CLOSURE YARATMA
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        
        if fullnameInput.text?.count != 0, emailInput.text?.count != 0, phoneInput.text?.count != 0, passwordInput.text?.count != 0{
            
            var user: User = User(fullName: fullnameInput.text!, email: emailInput.text!, phoneNumber: phoneInput.text!, password: passwordInput.text!, isActive: true)
            
            users.append(user)
            
            userCreated?(user)
            
        } else {
            
        }
    }
}
