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
            
            if (user.isActive) {
                guard let controller = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
                
                navigationController?.show(controller, sender: nil)
                
                print("elxan got")
                
                return
            }
        }
        
        for user in users {
            
            if (user.email == emailInput.text && user.password == passwordInput.text) {
                
                guard let controller = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
                
                navigationController?.show(controller, sender: nil)
                
                return
                
            }
        }
        
        let alertController = UIAlertController(title: "Error", message: "Wrong email or password", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
        
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

