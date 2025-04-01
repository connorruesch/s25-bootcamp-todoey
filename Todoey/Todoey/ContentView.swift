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
    @State var pickedColor: Color = .red
    @State var title: String = "Reminders"
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Title
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(pickedColor)
                    .padding(.bottom, 15)
                
                Spacer()
                
                // Settings Button
                Button {
                    isShowingSheet.toggle()
                } label: {
                    // Settings button
                    Image(systemName: "filemenu.and.cursorarrow")
                        .font(.title)
                        .foregroundStyle(pickedColor)
                }
            }
            
            // List that displays each To-Do
            List {
                ForEach($todos) { $todo in
                    TodoRowView(todo: $todo, pickedColor: $pickedColor)
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
                .foregroundStyle(pickedColor)
            }
        }
        .padding()
        .sheet(isPresented: $isShowingSheet) {
            SettingsView(pickedColor: $pickedColor, title: $title)
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
