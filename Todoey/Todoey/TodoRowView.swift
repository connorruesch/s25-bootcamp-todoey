//
//  TodoRowView.swift
//  Todoey
//
//  Created by Connor Ruesch on 4/1/25.
//

import SwiftUI

struct TodoRowView: View {
    @Binding var todo: Todo
    @Binding var pickedColor: Color
    
    var body: some View {
        HStack {
            Button {
                todo.isDone.toggle()
            } label: {
                Circle()
                    .stroke(pickedColor, lineWidth: 2)
                    .fill(todo.isDone ? pickedColor : pickedColor.opacity(0))
                    .frame(width: 25, height: 25)
            }
            
            TextField("", text: $todo.item)
                .font(.title3)
                .foregroundStyle(todo.isDone ? .gray : .primary)
                .strikethrough(todo.isDone, color: .gray)
        }
    }
}
