import SwiftUI

struct AddTodoView: View {
    
    /**
     PROPERTIES
     */
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    
    /**
     BODY
     */
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // Todo Name
                    TextField("Todo", text: $name)
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                } // Form
                .pickerStyle(SegmentedPickerStyle())
                // Gives it the picker style
                
                // Save Button
                Button(action: {
                    print("save a new todo item")
                }) {
                    Text("Save")
                } // Save Button
                
                
                Spacer()
            } // VStack
            .navigationBarTitle("New Todo", displayMode: .inline)
        } // NavigationView
    }
}
