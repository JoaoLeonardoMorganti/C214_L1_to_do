//
//  RealmManagerMock.swift
//  ToDoAppTests
//
//  Created by João Leonardo Morganti on 09/07/21.
//

import Foundation
@testable import ToDoApp

class RealmManagerMock {
    
    static let sharedInstance = RealmManagerMock()
    
    public var database = [Task.instantiate(toDoItem: "Tarefa 1"),
                            Task.instantiate(toDoItem: "Tarefa 2"),
                            Task.instantiate(toDoItem: "Tarefa 3"),
                            Task.instantiate(toDoItem: "Tarefa 4"),
                            Task.instantiate(toDoItem: "Tarefa 5")]
    
    public func add(task: Task) {
        self.database.append(task)
    }
    
    public func delete(task: Task) {
        for index in database.indices {
            if database[index] == task {
                self.database.remove(at: index)
            }
        }
    }
    
    public func read() -> [Task] {
        let result = self.database
        return result
    }
}
