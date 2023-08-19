//
//  ToDoListItemViewViewModel.swift
//  ToDoSwiftUI
//
//  Created by Shivansh Gupta on 18/08/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoItemModel)
    {
        var newItem = item
        newItem.setAsDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
