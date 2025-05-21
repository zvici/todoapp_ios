//
//  TodoItem.swift
//  todoapp
//
//  Created by Thanh Nhã on 21/5/25.
//

import Foundation

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool = false
}
