//
//  Task.swift
//  ToDoApp
//
//  Created by João Leonardo Morganti on 09/07/21.
//

import Foundation
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
