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
    @State var newToDo: String = ""
    
    var searchBar: some View {
        HStack {
            TextField("Nova tarefa", text: self.$newToDo)
            Button(action: self.addNewTask, label: {
                Text("Criar")
            })
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                self.searchBar.padding()
                List(self.taskStore.tasks) { task in
                    Text(task.toDoItem)
                }.navigationBarTitle("Tarefas")
            }
        }
    }
    
    func addNewTask() {
        self.taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: self.newToDo))
        self.newToDo = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
