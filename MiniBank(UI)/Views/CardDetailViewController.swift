//
//  CardDetailViewController.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 13.08.25.
//

import UIKit

class CardDetailViewController: UIViewController {

    @IBOutlet weak var cardTypeInput: UILabel!
    @IBOutlet weak var cardNameInput: UILabel!
    @IBOutlet weak var cardNumberInput: UILabel!
    @IBOutlet weak var expireDateInput: UILabel!
    @IBOutlet weak var cvcInput: UILabel!
    @IBOutlet weak var balanceInput: UILabel!
    
    var card: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardTypeInput.text = "Card Type: \(card.cardType.rawValue)"
        cardNameInput.text = "Card Name: \(card.cardName)"
        cardNumberInput.text = "Card Number: \(card.cardNumber)"
        expireDateInput.text = "Card Expiration Date: \(card.expirationDate)"
        cvcInput.text = "Card CVC: \(card.cvc)"
        balanceInput.text = "Card Balance: \(card.balance)"
        
    }
    

}
