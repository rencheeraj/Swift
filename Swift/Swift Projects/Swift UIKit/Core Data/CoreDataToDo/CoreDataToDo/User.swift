//
//  User.swift
//  CoreDataToDo
//
//  Created by Rencheeraj Mohan on 05/09/24.
//

import CoreData

public class User: NSManagedObject {
    @NSManaged var name : String
    @NSManaged var age : Int16
    @NSManaged var createdAt : Date
}
