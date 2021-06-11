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
                self.addNewTask(store: self.taskStore)
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
                        Text(task.toDoItem)
                    }.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                }.navigationBarTitle("Tarefas")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func addNewTask(store: TaskStore) {
        store.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: self.newToDo))
        self.newToDo = ""
    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        self.taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
