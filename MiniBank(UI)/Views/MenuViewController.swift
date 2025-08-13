import UIKit

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet private weak var menuCollection: UICollectionView!
    
    let menuItems: [String] = ["Cards", "Transfer", "Add Card", "Exit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuCollection.dataSource = self
        menuCollection.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeftLabelViewCell", for: indexPath) as? LeftLabelViewCell else {
            return UICollectionViewCell()
        }

        cell.configureCell(value: menuItems[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: view.bounds.width, height: 50)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let choose: String = String(menuItems[indexPath.row])
        
        var controller: UIViewController!
        
        if choose == "Cards" {
            
            if cards.isEmpty {
                
                controller = storyboard?.instantiateViewController(withIdentifier: "AddCardViewController") as? AddCardViewController
                
            } else {
                
                controller = storyboard?.instantiateViewController(withIdentifier: "CardsViewController") as? CardsViewController
                
            }
            
            
        } else if choose == "Add Card" {
          
            controller = storyboard?.instantiateViewController(withIdentifier: "AddCardViewController") as? AddCardViewController
            
        } else if choose == "Transfer" {
            
            if allCards.count >= 2 {
                
                controller = storyboard?.instantiateViewController(withIdentifier: "TransferViewController") as? TransferViewController
                
            } else {
                
                let alertController = UIAlertController(title: "Error", message: "Not enough cards to transfer", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
                
                return
            }
            
        } else {
            
            let dataManager = DataManager()
            dataManager.removeAllData()
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let delegate = windowScene.delegate as? SceneDelegate {
                    delegate.loginRoot()
                }
            }
            
            return

        }
        
        navigationController?.show(controller, sender: nil)
        
    }
    
}
