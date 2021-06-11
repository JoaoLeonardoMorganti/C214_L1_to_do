//
//  TaskStore.swift
//  ToDoApp
//
//  Created by João Leonardo Morganti on 11/06/21.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var toDoItem = String()
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
    
    func addNewTask(text: String) {
        self.tasks.append(Task(id: String(self.tasks.count + 1), toDoItem: text))
    }
}
