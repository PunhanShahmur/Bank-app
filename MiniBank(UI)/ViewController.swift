//
//  ViewController.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 09.08.25.
//

import UIKit

var users: [User] = []

class ViewController: UIViewController {

    @IBOutlet private weak var emailInput: UITextField!
    @IBOutlet private weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        for user in users {
            
            
        }
        
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return }
        
        controller.userCreated = { user in
        
            self.emailInput.text = user.email
            self.passwordInput.text = user.password
            
        }
        
        navigationController?.show(controller, sender: nil)
        
    }
    
}

