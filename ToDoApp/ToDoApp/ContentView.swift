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
            Button(action: {
                self.taskStore.addTask(text: self.newToDo)
                self.newToDo = ""
            }, label: {
                Text("Criar")
            })
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                self.searchBar.padding()
                List {
                    ForEach(self.taskStore.tasks) { task in
                        Text(task.toDoItem ?? "")
                    }.onDelete(perform: self.delete)
                }.navigationBarTitle("Tarefas")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        offsets.forEach ({ index in
            self.taskStore.deleteTask(index: index)
        })
    }
    
    init() {
        self.taskStore.updateTasks()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
