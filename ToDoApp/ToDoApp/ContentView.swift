//
//  ContentView.swift
//  ToDoApp
//
//  Created by João Leonardo Morganti on 07/05/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    
    var body: some View {
        NavigationView {
            VStack {
                List(self.taskStore.tasks) { task in
                    Text(task.toDoItem)
                }.navigationBarTitle("Tasks")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
