//
//  ContentView.swift
//  Todoey
//
//  Created by Connor Ruesch on 2/25/25.
//

import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
    // Todos State
    @State var todos: [Todo] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Reminders")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
                .padding(.bottom, 15)
            
            // List that displays each To-Do
            List {
                ForEach($todos) { $todo in
                    
                    // HStack that contains the icon and text field for the
                    // to-do
                    HStack {
                        Button {
                            todo.isDone.toggle()
                        } label: {
                            Circle()
                                .stroke(.blue, lineWidth: 2)
                                .fill(todo.isDone ? .blue : .blue.opacity(0))
                                .frame(width: 25, height: 25)
                        }
                        
                        TextField("", text: $todo.item)
                            .font(.title3)
                            .foregroundStyle(todo.isDone ? .gray : .primary)
                            .strikethrough(todo.isDone, color: .gray)
                    }
                    
                }
                .onDelete(perform: removeRows)
            }
            .listStyle(.plain)
            
            // Button to add a reminder
            Button {
                todos.append(Todo(item: "", isDone: false))
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Reminder")
                }
                .font(.title3)
                .fontWeight(.bold)
            }
        }
        .padding()
    }
    
    func removeRows(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
