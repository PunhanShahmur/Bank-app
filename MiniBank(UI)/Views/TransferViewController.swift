//
//  TransferViewController.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 09.08.25.
//

import UIKit

class TransferViewController: UIViewController {

    @IBOutlet private weak var senderCardInput: UITextField!
    @IBOutlet private weak var receiverCardInput: UITextField!
    @IBOutlet private weak var amountInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func transferTapped(_ sender: Any) {
//        
//        if let senderCard = senderCardInput.text, let receiverCard = receiverCardInput.text, let amount = Double(amountInput.text!){
//            
//            if senderCard.isEmpty || receiverCard.isEmpty || amount == 0 {
//                
//                showAlert(title: "Error", message: "Please fill all fields")
//                
//            } else {
//                
//                for senderCard in allCards {
//                    
//                    if senderCard.cardNumber == senderCardInput.text {
//                        
//                        for receiverCard in allCards {
//                            
//                            if receiverCard.cardNumber == receiverCardInput.text {
//                                
//                                if senderCard.balance >= amount {
//                                    
//                                    senderCard.balance -= amount
//                                    receiverCard.balance += amount
//                                    
//                                    return
//                                } else{
//                                    showAlert(title: "Error", message: "Not enough balance")
//                                }
//                            }
//                        }
//                    }
//                }
//                
//                showAlert(title: "Error", message: "Card not found")
//                navigationController?.popViewController(animated: true)
//            }
//        }
//
        guard
            let senderCardNumber = senderCardInput.text, !senderCardNumber.isEmpty,
            let receiverCardNumber = receiverCardInput.text, !receiverCardNumber.isEmpty,
            let amountText = amountInput.text, let amount = Double(amountText), amount > 0
        else {
            showAlert(title: "Error", message: "Please fill all fields correctly")
            return
        }
           
        // Sender index
        guard let senderIndex = allCards.firstIndex(where: { $0.cardNumber == senderCardNumber }) else {
            showAlert(title: "Error", message: "Sender card not found")
            return
        }
        
        // Receiver index
        guard let receiverIndex = allCards.firstIndex(where: { $0.cardNumber == receiverCardNumber }) else {
            showAlert(title: "Error", message: "Receiver card not found")
            return
        }
        
        // Balans yoxla
        if allCards[senderIndex].balance < amount {
            showAlert(title: "Error", message: "Not enough balance")
            return
        }
           
        // Transfer et
        
        
        allCards[senderIndex].balance -= amount
        allCards[receiverIndex].balance += amount
           
        showAlert(title: "Success", message: "Transfer completed")
        navigationController?.popViewController(animated: true)
        
    }
    
    private func showAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    
    }
}
