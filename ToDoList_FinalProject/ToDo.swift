//
//  ToDo.swift
//  ToDoList_FinalProject
//
//  Created by Mauro Mujica-Parodi on 3/5/22.
//

import Foundation

var todos: [ToDo] = [
    ToDo(name: "Task 1",
         description: "Example of a great description",
         priority: .p2,
         dueDate: "Mar 27, 2022"),
    ToDo(name: "Task 2",
         description: "Example of the best description",
         priority: .p1,
         dueDate: "May 22, 2022"),
    ToDo(name: "Task 3",
         description: "Pretty terrible example of a description",
         priority: .p4,
         dueDate: "Dec 07, 2023")]

class ToDo {
    
    enum `Priority`: String {
        case p1 = "urgent / important"
        case p2 = "urgent / not important"
        case p3 = "important / not urgent"
        case p4 = "not urgent / not important"
    }
    
    var name: String
    var description: String
    var priority: Priority
    var dueDate: String
    
    init(name: String, description: String, priority: Priority, dueDate: String) {
        self.name = name
        self.description = description
        self.priority = priority
        self.dueDate = dueDate
    }
    
}
