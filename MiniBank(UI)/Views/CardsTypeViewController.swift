//
//  CardsTypeViewController.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 12.08.25.
//

import UIKit

class CardsTypeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectedTypeCards: [Card]!
    
    @IBOutlet private weak var selectedCardsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedCardsCollection.delegate = self
        selectedCardsCollection.dataSource = self
        
        selectedCardsCollection.register(UINib(nibName: "LeftLabelViewCell", bundle: nil), forCellWithReuseIdentifier: "LeftLabelViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedTypeCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeftLabelViewCell", for: indexPath) as? LeftLabelViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(value: "Card Name: \(selectedTypeCards[indexPath.row].cardName)")
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "CardDetailViewController") as? CardDetailViewController else {
            return
        }
        
        controller.card = selectedTypeCards[indexPath.row] 
        present(controller, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width, height: 50)
    }
    

}
