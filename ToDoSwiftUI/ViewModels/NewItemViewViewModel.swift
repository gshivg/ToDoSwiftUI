//
//  NewItemViewViewModel.swift
//  ToDoSwiftUI
//
//  Created by Shivansh Gupta on 18/08/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title: String
    @Published var notes: String
    @Published var dueDate: Date
    @Published var showAlert: Bool
    
    init() {
        title = ""
        notes = ""
        dueDate = Date()
        showAlert = false
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get Current User Id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // Create Model
        let noteId = UUID().uuidString
        let newItem = ToDoItemModel(
            id: noteId,
            title: title,
            note: notes,
            duedate: dueDate.timeIntervalSince1970,
            createdAt: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Save Model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(noteId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
