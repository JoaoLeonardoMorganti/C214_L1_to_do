//
//  TaskStoreTests.swift
//  ToDoAppTests
//
//  Created by João Leonardo Morganti on 11/06/21.
//

import XCTest
@testable import ToDoApp

class TaskStoreTests: XCTestCase {
    var taskStore: TaskStoreMock!
    
    override func setUpWithError() throws {
        self.taskStore = TaskStoreMock()
        self.taskStore.tasks = RealmManagerMock.sharedInstance.database
    }

    override func tearDownWithError() throws {
        self.taskStore = nil
    }
    
    func testAddTask() throws {
        let lastTask = taskStore.tasks.last
        
        taskStore.addTask(text: "Tarefa 6")
        
        let newLastTask = taskStore.tasks.last
        
        XCTAssertTrue(taskStore.tasks.count == 6)
        XCTAssertTrue(taskStore.tasks.last?.toDoItem == "Tarefa 6")
        
        print("testAddTask")
        print(lastTask ?? "")
        print(newLastTask ?? "")
    }
    
    func testDeleteTask() throws {
        if taskStore.tasks.count >= 2 {
            let lastTask = taskStore.tasks.last
            
            taskStore.deleteTask(index: taskStore.tasks.count-1)
            
            let newLastTask = taskStore.tasks.last
            
            XCTAssertTrue(lastTask != newLastTask)
            
            print("testDeleteTask")
            print(lastTask ?? "")
            print(newLastTask ?? "")
        }
    }
}
