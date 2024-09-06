//
//  ViewController.swift
//  CoreDataToDo
//
//  Created by Rencheeraj Mohan on 05/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    let database = DatabaseHandler()
    var users : [User]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ageField.delegate = self
        nameField.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserTableviewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        users = database.fetchRequest(User.self)
    }
    @IBAction func saveBtnAction(_ sender: Any) {
        guard let  user = database.add(User.self) else {return}
        guard let name = nameField.text, let ageText = ageField.text, let age = Int16(ageText) else {return}
        user.name = name
        user.age = age
        user.createdAt = Date()
        users?.append(user)
        database.save()
    }
    
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableviewCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        if let item = users?[indexPath.row] {
            cell.nameLabel?.text = item.name
            cell.ageLabel?.text = String(item.age)
            cell.dateLabel?.text = "\(item.createdAt)"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}
extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


