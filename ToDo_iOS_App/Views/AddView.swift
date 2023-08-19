//
//  AddView.swift
//  ToDo_iOS_App
//
//  Created by Koulik Maity on 17/08/23.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText : String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("save".uppercased())
                        .frame(height: 55)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.top,20)
            }
            .padding(.top, 10)
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
        .navigationTitle("Add new Item 🖊")
        .alert(isPresented: $showAlert) {
            getAlert() 
        }
    }
    func saveButtonPressed(){
        if textIsAppropriate() == true {
            listViewModel.addItem(title: textFieldText)
            textFieldText = ""
            presentationMode.wrappedValue.dismiss()
        } else {
            
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item nust have more than 3 characters!!!"
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
