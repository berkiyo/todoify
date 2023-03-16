import SwiftUI

// ListView
struct ListView: View {
    
    // See --> "ListViewModel.swift"
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var showingAlert = false // this is for our alertview.
    
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty { // if there are no items, run this code.
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) {
                        item in ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem) // all from "ListViewModel.swift"
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        
        .navigationTitle("Infinity")
        .navigationBarItems(
            leading:
                EditButton(),
            trailing:
                HStack {
                    NavigationLink("✍️", destination: AddView())
                    Menu("⚙️") {
                        NavigationStack {
                            NavigationLink(destination: SettingsView()) {
                                Text("Settings")
                            }
                        }
                        Button("About") {
                            showingAlert = true // show popover view
                        }
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("About Infinity"),
                              message: Text("Infinity v0.0.1"),
                              dismissButton: .default(Text("OK")))
                    }
                }
            )
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func optionsPopup() {}
}
