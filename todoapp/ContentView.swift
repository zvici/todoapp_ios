//
//  ContentView.swift
//  todoapp
//
//  Created by Thanh Nhã on 21/5/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTodoTitle = ""

    func addTodo() {
        guard !newTodoTitle.isEmpty else { return }
        viewModel.addTodo(title: newTodoTitle)
        newTodoTitle = ""
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add new todo...", text: $newTodoTitle)
                        .padding(12)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .frame(height: 44)
                        .onSubmit {
                            addTodo()
                        }
                    Button(action: addTodo) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .frame(width: 48, height: 48)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                List {
                    ForEach(viewModel.items) {
                        item in
                        HStack {
                            Image(
                                systemName: item.isDone
                                    ? "checkmark.circle.fill" : "circle"
                            )
                            .onTapGesture {
                                viewModel.toggleDone(item: item)
                            }
                            .foregroundColor(item.isDone ? .black : .gray)
                            Text(item.title)
                                .strikethrough(item.isDone)
                                .foregroundColor(item.isDone ? .gray : .primary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .listRowInsets(EdgeInsets())
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 2)
                        ).padding(.vertical, 3)
                    }
                    .onDelete(perform: viewModel.delete)
                }.listStyle(.plain)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Todo App")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
