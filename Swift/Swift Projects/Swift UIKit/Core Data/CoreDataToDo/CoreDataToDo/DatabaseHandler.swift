//
//  DatabaseHandler.swift
//  CoreDataToDo
//
//  Created by Rencheeraj Mohan on 05/09/24.
//

import UIKit
import CoreData

class DatabaseHandler{
    private let viewcontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    func add<T: NSManagedObject> (_ type: T.Type) -> T?{
        guard let entityName = T.entity().name else {return nil}
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: viewcontext) else {return nil}
        let object = T(entity: entity, insertInto: viewcontext)
        return object
    }
    
    func fetchRequest<T:NSManagedObject> (_ type: T.Type)-> [T] {
        let request = T.fetchRequest()
        do {
            let result = try viewcontext.fetch(request)
            return result as! [T]
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func save(){
        do {
            try viewcontext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
