//
//  RealmManager.swift
//  ToDoApp
//
//  Created by João Leonardo Morganti on 09/07/21.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let sharedInstance = RealmManager()
    
    private let database: Realm
    
    private init() {
        self.database = try! Realm()
    }
    
    public func addTask(task: Task) {
        try! self.database.write {
            self.database.add(task)
        }
    }
    
    public func deleteTask(task: Task) {
        try! self.database.write {
            self.database.delete(task)
        }
    }
    
}
