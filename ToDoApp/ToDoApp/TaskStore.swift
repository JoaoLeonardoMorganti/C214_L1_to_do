//
//  TaskStore.swift
//  ToDoApp
//
//  Created by João Leonardo Morganti on 11/06/21.
//

import Foundation
import SwiftUI
import Combine
import RealmSwift

extension Task {
    public static func instantiate(toDoItem: String) -> Task {
        let task = Task()
        task.id = UUID().uuidString
        task.toDoItem = toDoItem
        
        return task
    }
}

class Task: Object, Identifiable {
    @objc dynamic var id: String?
    @objc dynamic var toDoItem: String?
}

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
