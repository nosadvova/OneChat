
import UIKit
import FirebaseCore
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
   let regController = RegisterVC()
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text
        {
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            if let e = error
            {
                print(e.localizedDescription)
            }
            else
            {
                self.performSegue(withIdentifier: "loginWay", sender: self)
            }
            
        }
        }
    }
    
    


}
