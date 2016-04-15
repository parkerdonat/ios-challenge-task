//
//  TaskController.swift
//  ios-challenge-task
//
//  Created by Parker Donat on 4/15/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    private let kTaskKey = "Task"
    
    private let sharedInstance = TaskController()
    
    var tasks: [Task] {
        let request = NSFetchRequest(entityName: kTaskKey)
        
        do {
          return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Task]
        } catch {
            return []
        }
    }
    
    var completeTasks: [Task] {
        return tasks.filter({$0.isComplete.boolValue})
    }
    
    var incompleteTasks: [Task] {
        return tasks.filter({!$0.isComplete.boolValue})
    }
    
    func addTask(task: Task) {
        // I can't remember if I was suppose to pass all the task properties here or not. :/
        saveToPersistentStorage()
    }
    
    func removeTask(task: Task) {
        Stack.sharedStack.managedObjectContext.deleteObject(task)
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Hey, you! Somthing didn't save right with core data.")
        }
    }
}
