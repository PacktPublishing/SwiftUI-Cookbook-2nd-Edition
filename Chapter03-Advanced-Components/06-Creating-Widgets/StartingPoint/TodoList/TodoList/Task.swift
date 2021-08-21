//
//  Task.swift
//  TodoList
//
//  Created by Edgar Nzokwe on 8/15/21.
//

import Foundation

enum Priority:Comparable{
    case high
    case medium
    case low
}
struct Task: Identifiable{
    var id = UUID()
    var completed:Bool
    var description:String
    var priority:Priority

}

var tasks = [
    Task(completed: false, description: "Wake up", priority: .low ),
    Task(completed: false, description: "Shower", priority: .medium),
    Task(completed: false, description: "Code", priority: .high),
    Task(completed: false, description: "Eat", priority: .high ),
    Task(completed: false, description: "Sleep", priority: .high),
    Task(completed: false, description: "Get groceries", priority: .high)
]
