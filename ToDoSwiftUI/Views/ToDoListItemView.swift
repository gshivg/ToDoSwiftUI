//
//  ToDoListItemView.swift
//  ToDoSwiftUI
//
//  Created by Shivansh Gupta on 18/08/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoItemModel
    var body: some View {
            HStack{
                VStack (alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .bold()
                    if !item.note.trimmingCharacters(in: .whitespaces).isEmpty {
                        Text(item.note)
                            .font(.body)
                    }
                    Text("\(Date(timeIntervalSince1970: item.duedate).formatted(date: .abbreviated, time: .shortened))")
                        .font(.footnote)
                        .foregroundColor(.indigo)
                }
                 
                Spacer()
                
                Button {
                    viewModel.toggleIsDone(item: item)
                } label: {
                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(.blue)
                }
            }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(
            item: ToDoItemModel(
                id: "123",
                title: "Hello",
                note: "hello World",
                duedate: Date().timeIntervalSince1970,
                createdAt: Date().timeIntervalSince1970,
                isDone: false
            )
        )
    }
}
