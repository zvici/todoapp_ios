//
//  TodoViewModel.swift
//  todoapp
//
//  Created by Thanh Nhã on 21/5/25.
//

import Combine
import Foundation

class TodoViewModel: ObservableObject {
    @Published var items: [TodoItem] = [
    ]

    func addTodo(title: String) {
        let newTodo = TodoItem(title: title)
        items.append(newTodo)
    }

    func toggleDone(item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isDone.toggle()
        }
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
