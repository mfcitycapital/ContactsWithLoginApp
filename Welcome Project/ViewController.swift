//
//  ViewController.swift
//  Welcome Project
//
//  Created by Arslan Rashidov on 01.07.2021.
//

import UIKit

class ViewController:
    
    UIViewController {
    
    @IBOutlet weak var topTextLabel: UILabel!
    var correctLogin: String = "Admin"
    var correctPassword: String = "Admin"
    
    
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        if loginTextField.text == correctLogin && passwordTextField.text == correctPassword{
            topTextLabel.text = "Login Succesful"
            
            guard let contactsViewController = storyboard?.instantiateViewController(withIdentifier: "AllContactsViewController") as? AllContactsViewController else {return}
            
            navigationController?.pushViewController(contactsViewController, animated: true)
        }
    }
    

}

