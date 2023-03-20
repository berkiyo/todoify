import SwiftUI

// ListView
struct ListView: View {
    
    // See --> "ListViewModel.swift"
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var showingAlert = false // this is for our alertview.
    
    // Checking if 24 hours has lapsed
    
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
                                    listViewModel.updateItem(item: item) // update item
                                    
                                    // formatting the date
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = "d"
                                    let newDate = formatter.string(from: item.todaysDate)
                                    let newDateInt = Int(newDate) ?? 0
                                    print(newDateInt) // DEBUG PURPOSES
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
                        Button("❓ How To Guide") {
                           // 
                        }
                        Button("📱 Change App Icon") {
                         //   
                        }
                        Button("🧐 About") {
                            showingAlert = true // show popover view
                        }
                        Button("💎 Infinity Premium") {
                            showingAlert = true // temporary
                        }
                        Button("✉️ Feedback") {
                            showingAlert = true // temporary
                        }
                        Button("⭐️ Rate on App Store") {
                            showingAlert = true // temporary
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
