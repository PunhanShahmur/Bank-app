//
//  AddCardViewController.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 09.08.25.
//

import UIKit

class AddCardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet private weak var cardNameInput: UITextField!
    @IBOutlet private weak var cardNumberInput: UITextField!
    @IBOutlet private weak var expireDateInput: UITextField!
    @IBOutlet private weak var cvcInput: UITextField!
    @IBOutlet private weak var cardTypeInput: UITextField!
    
    private var selectedCardType: CardType?
    private let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        picker.dataSource = self
        cardTypeInput.inputView = picker
    }
    
    
    @objc func doneSelecting() {
        view.endEditing(true)
    }
    
    // MARK: PickerView Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        CardType.allCases.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        CardType.allCases[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCardType = CardType.allCases[row]
        cardTypeInput.text = selectedCardType?.rawValue
    }
    
    @IBAction func addCardTapped(_ sender: Any) {
        
        if let cardName = cardNameInput.text, let cardNumber = cardNumberInput.text, let expireDate = expireDateInput.text, let cvcInput = cvcInput.text {
            
            if cardName.isEmpty || cardNumber.isEmpty || expireDate.isEmpty || cvcInput.isEmpty || selectedCardType == nil {
                
                let alertController = UIAlertController(title: "Error", message: "All fields must be filled", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(alertAction)
                present(alertController, animated: true)
                
            } else {
                
                let card: Card = .init(cardName: cardName, cardNumber: cardNumber, expirationDate: expireDate, cvc: cvcInput, cardType: selectedCardType!)
                
                addCard(card)
                allCards.append(card)
                
                navigationController?.popViewController(animated: true)
                
            }
        }
    }
}
