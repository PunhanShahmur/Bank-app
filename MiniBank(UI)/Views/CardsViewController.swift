//
//  CardsViewController.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 09.08.25.
//

import UIKit

class CardsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet private weak var cardCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCollection.delegate = self
        cardCollection.dataSource = self
        
        cardCollection.register(UINib(nibName: "LeftLabelViewCell", bundle: nil), forCellWithReuseIdentifier: "LeftLabelViewCell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CardType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeftLabelViewCell", for: indexPath) as? LeftLabelViewCell else { return UICollectionViewCell() }
        
        
        let type = CardType.allCases[indexPath.row]
        cell.configureCell(value: type.cardType)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let selectedTypeCards: [Card] = cards[CardType.allCases[indexPath.row]], selectedTypeCards.count != 0 {
            guard let controller = storyboard?.instantiateViewController(identifier: "CardsTypeViewController") as? CardsTypeViewController else { return }
            
            controller.selectedTypeCards = selectedTypeCards
            navigationController?.show(controller, sender: nil)
            
        } else {
            let alertController = UIAlertController(title: "No cards", message: "You don't have any cards of this type", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(alertAction)
            present(alertController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width, height: 50)
    }
    
    
}
