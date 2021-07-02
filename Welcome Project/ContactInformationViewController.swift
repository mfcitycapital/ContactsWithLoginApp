//
//  ContactInformationViewController.swift
//  Welcome Project
//
//  Created by Arslan Rashidov on 02.07.2021.
//

import UIKit

protocol ContactInformationDelegate: AnyObject{
    func SaveNewData(_ contact: ContactCellData)
}

class ContactInformationViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var workPlaceTextField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    
    var contact: ContactCellData?
    weak var delegate: ContactInformationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = contact?.name
        surnameTextField.text = contact?.surname
        phoneNumberTextField.text = contact?.phoneNumber
        workPlaceTextField.text = contact?.workPlace
        commentTextView.text = contact?.comment
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        contact?.name = nameTextField.text!
        contact?.surname = surnameTextField.text!
        contact?.phoneNumber = phoneNumberTextField.text!
        contact?.workPlace = workPlaceTextField.text!
        contact?.comment = commentTextView.text
    
        if let contact = contact{
            delegate?.SaveNewData(contact)
        }
        
        
        
        dismiss(animated: true)
    }
    

    

}
