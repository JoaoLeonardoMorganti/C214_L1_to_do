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
    
    public func add(task: Task) {
        try! self.database.write {
            self.database.add(task)
        }
    }
    
    public func delete(task: Task) {
        try! self.database.write {
            self.database.delete(task)
        }
    }
    
    public func read() -> Results<Task> {
        let result = self.database.objects(Task.self)
        print(result)
        return result
    }
}
