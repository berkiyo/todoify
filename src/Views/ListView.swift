import SwiftUI

// ListView
struct ListView: View {
    
    // See --> "ListViewModel.swift"
    @EnvironmentObject var listViewModel: ListViewModel
    
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
                    NavigationLink("✏️", destination: AddView())
                    Menu("⚙️") {
                        Button("Clear List", action: clearList)
                        Button("Options", action: optionsPopup)
                        Button("About", action: aboutPopup)
                    }
                }
            )
        .navigationBarTitleDisplayMode(.inline) 
    }
    
    // Work in progress
    func clearList() {}
    func optionsPopup() {}
    func aboutPopup() {}
}
