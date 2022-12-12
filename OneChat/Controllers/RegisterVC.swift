

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorText: UILabel!

    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text
        {
        Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
            if let e = error
            {
                self.errorText.text = e.localizedDescription
            }
            else
            {
                self.performSegue(withIdentifier: "registerWay", sender: self)
            }
        }
        }
    }
    

}
