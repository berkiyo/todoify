import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode // telling us where we are in the view hierarchy
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    // Alerts for fields
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)

                HStack {
                    Button(action: saveButtonPressed, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: 200)
                            .background(Color.accentColor)
                            .cornerRadius(10, antialiased: true)
                        
                        Button(action: clearButtonPressed, label: {
                            Text("Clear".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 55)
                                .frame(maxWidth: 200)
                                .background(Color.gray)
                                .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        })
                    })
                }
            }
            .padding(14) // add some padding
        }
        .navigationTitle("Add an item ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    /**
     saveButtonPressed() 
     When the save button is pressed, this function comes into action.
     */
    func saveButtonPressed() {
        if textIsAppropriate() { // if textIsAppropriate is true...
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss() // go back one in the presentation view hierarchy.
        }
        
    }
    
    /**
     clearButtonPressed()
     When the clear button is pressed, it will clear out all the text in the field
     */
    func clearButtonPressed() {
        textFieldText = ""
    }
    
    /**
     textIsAppropriate() 
     Check and see if the number of characters is appropriate
     */    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    /**
     getAlert()
     Initiates the alert function.
     */
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}   

