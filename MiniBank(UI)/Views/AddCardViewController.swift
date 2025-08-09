//
//  AddCardViewController.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 09.08.25.
//

import UIKit

class AddCardViewController: UIViewController {

    @IBOutlet private weak var cardNameInput: UITextField!
    @IBOutlet private weak var cardNumberInput: UITextField!
    @IBOutlet private weak var expireDateInput: UITextField!
    @IBOutlet private weak var cvcInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCardTapped(_ sender: Any) {
    }
    

}
