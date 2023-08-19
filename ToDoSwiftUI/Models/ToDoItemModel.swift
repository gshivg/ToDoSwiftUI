//
//  ToDoItemModel.swift
//  ToDoSwiftUI
//
//  Created by Shivansh Gupta on 18/08/23.
//

import Foundation

struct ToDoItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let note: String
    let duedate: TimeInterval
    let createdAt: TimeInterval
    var isDone: Bool
    
    mutating func setAsDone(_ state: Bool){
        isDone = state
    }
}
