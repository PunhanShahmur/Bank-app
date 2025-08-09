import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet private weak var fullnameInput: UITextField!
    @IBOutlet private weak var emailInput: UITextField!
    @IBOutlet private weak var phoneInput: UITextField!
    @IBOutlet private weak var passwordInput: UITextField!
    
    var userCreated: (( User ) -> Void)?  /// CLOSURE YARATMA
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        
        if fullnameInput.text?.count != 0, emailInput.text?.count != 0, phoneInput.text?.count != 0, passwordInput.text?.count != 0{
    
            for user in users {
                if user.email == emailInput.text {
                    let alertController = UIAlertController(title: "Email already exists", message: nil, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .default)
                    alertController.addAction(alertAction)
                    present(alertController, animated: true)
                    
                    return
                }
            }
            
            let user: User = User(fullName: fullnameInput.text!, email: emailInput.text!, phoneNumber: phoneInput.text!, password: passwordInput.text!, isActive: true)
            
            users.append(user)
            
            userCreated?(user)
            navigationController?.popViewController(animated: true)  ///PUSH --- POP işləyir
                                                                     ///SHOW --- DISMISS işləyir
            
        } else {
            
            let alerController = UIAlertController(title: "All fields must be filled", message: nil, preferredStyle: .alert)
            let alerAction = UIAlertAction(title: "OK", style: .default)
            alerController.addAction(alerAction)
            present(alerController, animated: true)
            
        }
    }
}
