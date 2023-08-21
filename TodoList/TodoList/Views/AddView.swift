//
//  AddView.swift
//  TodoList
//
//  Created by Muhammadjon Madaminov on 12/07/23.
//

import SwiftUI

let color1: Color = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
let color2: Color = Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))

struct AddView: View {
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismissValue

    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here... ", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .keyboardType(.default)
                Button {
                    saveButton()
                } label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(textIsAgreed() ? Color.accentColor : Color.secondary)
                        .cornerRadius(10)
                        .opacity(textIsAgreed() ? 1 : 0.7)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖋️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButton() {
        if textIsAgreed() {
            listViewModel.addItem(title: textFieldText)
            dismissValue.callAsFunction()
        } else {
            showAlert.toggle()
        }
        
    }
    
    func textIsAgreed() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your title must be at least 3 characters 😨😨!!!"
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
