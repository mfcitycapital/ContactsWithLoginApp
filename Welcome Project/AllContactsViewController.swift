//
//  AllContactsViewController.swift
//  Welcome Project
//
//  Created by Arslan Rashidov on 02.07.2021.
//

import UIKit

class AllContactsViewController: UIViewController {

    @IBOutlet weak var contactsTableView: UITableView!
    
    var data: [ContactCellData] = [
        ContactCellData(id: 0, name: "Петр",surname:"Гейтс", phoneNumber: "+79234445512", workPlace:"Intel",  comment:"1"),
        ContactCellData(id: 1,name:"Иван", surname:"", phoneNumber: "+78345551256", workPlace:"Apple",  comment:"2"),
        ContactCellData(id: 2,name:"Светлана",surname:"Гейтс", phoneNumber: "+79822324478", workPlace:"Intel",  comment:"3"),
        ContactCellData(id: 3,name:"Анастасия",surname:"Цукерберг", phoneNumber: "+79123450912", workPlace:"Apple",  comment:"4"),
        ContactCellData(id: 4,name:"Мария",surname:"Гейтс", phoneNumber: "+12324554123", workPlace:"Intel",  comment:"5"),
        ContactCellData(id: 5,name:"Аркадий",surname:"Цукерберг", phoneNumber: "+71234567890", workPlace:"Apple",  comment:"6"),
        ContactCellData(id: 6,name:"Руслан",surname:"Гейтс", phoneNumber: "5554545", workPlace:"Intel",  comment:"7"),
        ContactCellData(id: 7,name:"Артём",surname:"Цукерберг", phoneNumber: "3247856", workPlace:"",  comment:"Apple"),
        ContactCellData(id: 8,name:"Алина",surname:"Гейтс", phoneNumber: "+79456842113", workPlace:"Intel",  comment:"8"),
        ContactCellData(id: 9,name:"Вероника",surname:"Цукерберг", phoneNumber: "+11111111111", workPlace:"Apple",  comment:"9"),
        ContactCellData(id: 10,name:"Александр",surname:"Гейтс", phoneNumber: "2345568", workPlace:"Intel",  comment:"10"),
        ContactCellData(id: 11,name:"Татьяна",surname:"Цукерберг", phoneNumber: "+4234542457", workPlace:"Apple",  comment:"11"),
        ContactCellData(id: 12,name:"Антон",surname:"Гейтс", phoneNumber: "+61232211122", workPlace:"Intel",  comment:"12"),
        ContactCellData(id: 13,name:"Василий",surname:"Цукерберг", phoneNumber: "+76231231323", workPlace:"Apple",  comment:"13"),
        ContactCellData(id: 14,name:"Алина",surname:"Гейтс", phoneNumber: "+79456842113", workPlace:"Intel",  comment:"14"),
        ContactCellData(id: 15,name:"Альберт",surname:"Цукерберг", phoneNumber: "+79456823123", workPlace:"Apple",  comment:"15"),
        ContactCellData(id: 16,name:"Магомед",surname:"Гейтс", phoneNumber: "+79456842113", workPlace:"Intel",  comment:"16"),
        ContactCellData(id: 17,name:"Данил",surname:"Гейтс", phoneNumber: "+42131234", workPlace:"Apple",  comment:"17"),
        ContactCellData(id: 18,name:"Артём",surname:"Цукерберг", phoneNumber: "+45354353453", workPlace:"Intel",  comment:"18"),
        ContactCellData(id: 19,name:"Георгий",surname:"Цукерберг", phoneNumber: "+534531", workPlace:"Apple",  comment:"19"),
        ContactCellData(id: 20,name:"Наташа",surname:"Гейтс", phoneNumber: "+79456842113", workPlace:"Intel",  comment:"20"),
        ContactCellData(id: 21,name:"Виктория",surname:"Цукерберг", phoneNumber: "+23123231", workPlace:"Apple",  comment:"21")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
    }

}

extension AllContactsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let contactInformationViewController = storyboard?.instantiateViewController(withIdentifier: "ContactInformationViewController") as? ContactInformationViewController else {return}
        
        contactInformationViewController.delegate = self
        contactInformationViewController.contact = data[indexPath.row]
        
        present(contactInformationViewController, animated: true)
         
        
    }
}

extension AllContactsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_  tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as? ContactTableViewCell else {return UITableViewCell()}
        cell.setData(contact: data[indexPath.row])
        return cell
    }
}

extension AllContactsViewController: ContactInformationDelegate{
    func SaveNewData(_ contact: ContactCellData) {
        if let indexPath = data.firstIndex(where: {element in
            return element.id == contact.id
        }){
            data[indexPath] = contact
        }
    }
}

struct ContactCellData{
    let id: Int
    var name: String
    var surname: String
    var phoneNumber: String
    var workPlace: String
    var comment: String
}
