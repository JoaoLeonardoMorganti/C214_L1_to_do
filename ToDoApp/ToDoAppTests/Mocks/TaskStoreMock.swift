//
//  TaskStoreMock.swift
//  ToDoAppTests
//
//  Created by João Leonardo Morganti on 09/07/21.
//

import Foundation
@testable import ToDoApp

class TaskStoreMock {
    var tasks = [Task]()
    
    func addTask(text: String) {
        let task = Task.instantiate(toDoItem: text)
        
        RealmManagerMock.sharedInstance.add(task: task)
        
        self.updateTasks()
    }
    
    func deleteTask(index: Int) {
        RealmManagerMock.sharedInstance.delete(task: self.tasks[index])
        
        self.updateTasks()
    }
    
    func updateTasks() {
        let result = RealmManagerMock.sharedInstance.read()
        
        self.tasks = result
    }
}
