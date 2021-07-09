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

class Task: Object, Identifiable {
    public var id: String!
    public var toDoItem: String!
    
    public init(id: String, toDoItem: String) {
        self.id = id
        self.toDoItem = toDoItem
    }
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
    
    func addNewTask(text: String) {
        self.tasks.append(Task(id: String(self.tasks.count + 1), toDoItem: text))
    }
}
