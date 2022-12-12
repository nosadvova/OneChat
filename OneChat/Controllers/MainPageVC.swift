//
//  MainPageVC.swift
//  OneChat
//
//  Created by Vova Novosad on 10.12.2022.
//

import UIKit

class MainPageVC: UIViewController {

    @IBOutlet weak var mainPageTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainPageTitle.text = ""
        
        let text = "⚡️OneChat"
        var index = 0.0
        
        for letter in text
        {
            Timer.scheduledTimer(withTimeInterval: 0.2 * index, repeats: false, block: { (timer) in
                self.mainPageTitle.text?.append(letter)
            })
            index += 1
            }
        
        }
        

    
    
    }
    




