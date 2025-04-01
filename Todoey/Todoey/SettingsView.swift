//
//  SettingsView.swift
//  Todoey
//
//  Created by Connor Ruesch on 4/1/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var pickedColor: Color
    @Binding var title: String
    
    var colors: [Color] = [
        Color.blue,
        Color.cyan,
        Color.green,
        Color.red,
        Color.pink,
        Color.purple,
        Color.orange,
        Color.yellow
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            VStack {
                Circle()
                    .overlay {
                        Image(systemName: "filemenu.and.cursorarrow")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                    }
                    .frame(width: 95, height: 95)
                    .foregroundStyle(pickedColor)
                
                TextField("Title:", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(10)
                    .padding()
                    .font(.title3)
                    .foregroundStyle(pickedColor)
            }
            .padding(30)
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(20)
        .padding(.horizontal, 40)
        
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(colors, id: \.self) { color in
                    Button {
                        pickedColor = color
                    } label: {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(color)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(20)
        .padding(.horizontal, 40)
    }
}
