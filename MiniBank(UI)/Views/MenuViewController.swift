import UIKit

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet private weak var menuCollection: UICollectionView!
    
    let menuItems: [String] = ["Cards", "Transfer", "Profile"]
    
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
        
        cell.label.text = menuItems[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: view.bounds.width, height: 50)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
}
