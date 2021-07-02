//
//  ContactTableViewCell.swift
//  Welcome Project
//
//  Created by Arslan Rashidov on 02.07.2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(contact: ContactCellData){
        nameLabel.text = contact.name
        phoneNumberLabel.text = contact.phoneNumber
    }

}
