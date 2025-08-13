//
//  ViewController.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 09.08.25.
//

import UIKit

var users: [User] = []
var cards: [CardType : [Card]] = [:]
var allCards: [Card] = []

func addCard(_ card: Card) {
    cards[card.cardType, default: []].append(card)
}

class ViewController: UIViewController {

    @IBOutlet private weak var emailInput: UITextField!
    @IBOutlet private weak var passwordInput: UITextField!
    
    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        if let email = emailInput.text, let password = passwordInput.text, !email.isEmpty, !password.isEmpty {
            
            for user in users {
               
                if (user.email == emailInput.text && user.password == passwordInput.text) {
                    
                    dataManager.saveData(value: user.email, key: .email)
                    dataManager.saveData(value: user.password, key: .password)
                    dataManager.saveData(value: true, key: .isLoggedIn)
                
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        
                        if let delegate = windowScene.delegate as? SceneDelegate {
                            
                            delegate.countryRoot()
                            
                        }
                    }
    
                    return
                }
            }
            
            let alertController = UIAlertController(title: "Error", message: "Wrong email or password", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(alertAction)
            present(alertController, animated: true)
            
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

