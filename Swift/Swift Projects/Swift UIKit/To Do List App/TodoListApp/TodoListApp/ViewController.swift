//
//  ViewController.swift
//  TodoListApp
//
//  Created by Rencheeraj Mohan on 02/08/24.
//

import UIKit

class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func readAllItems() {
        do {
            let items = try context.fetch(ToDoListItem.fetchRequest())
        } catch {
            //error
        }
    }
    
    func createItem(name: String){
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
        } catch {
            // Error
        }
        
    }
    func deleteItem(item: ToDoListItem){
        context.delete(item)
        
        do {
            try context.save()
        } catch {
            // Error
        }
        
    }
    func updateItem(item: ToDoListItem, newName: String){
        item.name = newName
        
        do {
            try context.save()
        } catch {
            // Error
        }
    }

}

