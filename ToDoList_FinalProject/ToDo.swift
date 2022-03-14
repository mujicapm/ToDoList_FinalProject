//
//  ToDo.swift
//  ToDoList_FinalProject
//
//  Created by Mauro Mujica-Parodi on 3/14/22.
//

import Foundation

var todos: [ToDo] = []

class ToDo {
    
    enum `Priority`: String {
        case p1 = "urgent / important"
        case p2 = "urgent / not important"
        case p3 = "important / not urgent "
        case p4 = "not urgent / not important"
    }
    
    var name: String
    var description: String
    var priority: Priority
    var dueDate: Date
    
    init(name: String, description: String, priority: Priority, dueDate: Date) {
        self.name = name
        self.description = description
        self.priority = priority
        self.dueDate = dueDate
    }
    
}
