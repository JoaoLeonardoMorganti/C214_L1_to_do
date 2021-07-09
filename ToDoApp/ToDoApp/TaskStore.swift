//
//  TaskStore.swift
//  ToDoApp
//
//  Created by João Leonardo Morganti on 11/06/21.
//

import Foundation

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
    
    func addTask(text: String) {
        let task = Task.instantiate(toDoItem: text)
        
        RealmManager.sharedInstance.add(task: task)
        
        self.updateTasks()
    }
    
    func deleteTask(index: Int) {
        RealmManager.sharedInstance.delete(task: self.tasks[index])
        
        self.updateTasks()
    }
    
    func updateTasks() {
        let result = RealmManager.sharedInstance.read()
        
        self.tasks = result.compactMap({ (task) -> Task? in
            return task
        })
    }
}
