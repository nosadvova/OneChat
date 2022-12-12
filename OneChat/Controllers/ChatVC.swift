
import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class ChatVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var messageField: UITextField!
    
    let database = Firestore.firestore()
    var messages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        chatTableView.dataSource = self
        chatTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "messageCell")

    }
    
//MARK: - TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageCell
           cell.messageLabel.text = messages[indexPath.row].text
           
           return cell
       }


}
