//
//  Task.swift
//  ios-challenge-task
//
//  Created by Parker Donat on 4/15/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {

    convenience init(name: String, due: NSDate? = nil, notes: String? = nil, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.due = due
        self.notes = notes
        self.isComplete = false
    }

}
