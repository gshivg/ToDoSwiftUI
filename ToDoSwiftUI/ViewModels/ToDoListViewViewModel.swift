//
//  ToDoListViewViewModel.swift
//  ToDoSwiftUI
//
//  Created by Shivansh Gupta on 18/08/23.
//

import Foundation
import FirebaseFirestore


class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView: Bool
    private let userId: String
    init(userId: String) {
        showingNewItemView = false
        self.userId = userId
    }
    
    ///  Delete Todo LIst Item
    /// - Parameter id: item id to delete
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
