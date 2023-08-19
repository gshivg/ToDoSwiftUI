//
//  NewItemView.swift
//  ToDoSwiftUI
//
//  Created by Shivansh Gupta on 18/08/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemViewPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top)
            Form {
                // Title
                TextField("Title", text: $viewModel.title, prompt: Text("Title"))
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Any Notes
                TextField("Additional Notes", text: $viewModel.notes)
                    .onChange(of: viewModel.notes){ _ in
                        viewModel.notes = String(viewModel.notes.prefix(30))
                    }
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Submit Button
                TLButton(
                    title: "Add",
                    background: .pink
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemViewPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Fill in the title or do not select a due date in the past."))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemViewPresented: .constant(true))
    }
}
