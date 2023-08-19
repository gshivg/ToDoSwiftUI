//
//  ToDoListItemsView.swift
//  ToDoSwiftUI
//
//  Created by Shivansh Gupta on 18/08/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoItemModel]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel =
        StateObject(
            wrappedValue: ToDoListViewViewModel(
                userId: userId
            )
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.deleteItem(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemViewPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "djHg0lH38tWW3l2X6YLFqqNWf732")
    }
}
