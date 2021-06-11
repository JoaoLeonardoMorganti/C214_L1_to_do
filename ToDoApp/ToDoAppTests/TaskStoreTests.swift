//
//  TaskStoreTests.swift
//  ToDoAppTests
//
//  Created by João Leonardo Morganti on 11/06/21.
//

import XCTest
@testable import ToDoApp

class TaskStoreTests: XCTestCase {
    var taskStore: TaskStore!
    
    override func setUpWithError() throws {
        self.taskStore = TaskStore()
    }

    override func tearDownWithError() throws {
        self.taskStore = nil
    }
    
    func testTaskIdGenerator() {
        let TASK_1 = "task1"
        let TASK_2 = "task2"
        let TASK_3 = "task4"
        
        self.taskStore.addNewTask(text: TASK_1)
        self.taskStore.addNewTask(text: TASK_2)
        self.taskStore.addNewTask(text: TASK_3)
        
        if let task2 = self.taskStore.tasks.first(where: {$0.toDoItem == TASK_2}) {
            XCTAssertTrue(Int(task2.id) == 2)
        } else {
            XCTAssertTrue(false)
        }
    }
}
