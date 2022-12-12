
import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class ChatVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageField: UITextField!
    
    let database = Firestore.firestore()
    var messages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "messageCell")
        
        loadMessages()
    }
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true) }
        catch {
            print("Sign out error")
        }
    }
    
    
    //MARK: - Working with data
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        if let message = messageField.text, let userSender = Auth.auth().currentUser?.email
        {
            database.collection("messages").addDocument(data: ["sender" : userSender, "text" : message, "date" : Date().timeIntervalSince1970])
            { error in
                if let e = error
                {
                    print("Error, especially",e)
                }
                else
                {
                    print("Data saved succesfully")
                }
            }
        }
        messageField.text = ""
    }
    
    
    func loadMessages()
    {
        messages = []
        database.collection("messages")
            .order(by: "date")
            .addSnapshotListener {querySnapshot, error in
           
            self.messages = []
            if let err = error {
                    print("Error getting documents: \(err)")
                } else {
                        if let snaphotDocuments = querySnapshot?.documents
                        {
                            for doc in snaphotDocuments
                            {
                                let data = doc.data()
                                if let sender = data["sender"] as? String
                                    , let body = data["text"] as? String
                                {
                                    let newMessage = Message(sender: sender, text: body)
                                    self.messages.append(newMessage)
                                    
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
                                        let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        
}



//MARK: - TableView functions
extension ChatVC : UITableViewDataSource
{
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messages.count
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageCell
               let message = messages[indexPath.row]
               
               cell.messageLabel.text = message.text
               
               if message.sender == Auth.auth().currentUser?.email
               {
                   cell.leftImage.isHidden = false
                   cell.rightImage.isHidden = true
                   cell.messageBubble.backgroundColor = .cyan
                   cell.messageLabel.textColor = .black
               }
               else
               {
                   cell.rightImage.isHidden = false
                   cell.leftImage.isHidden = true
                   cell.messageBubble.backgroundColor = .purple
                   cell.messageLabel.textColor = .white
               }
               
               return cell
           }
}
    

