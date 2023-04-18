import SwiftUI

// ListView
struct ListView: View {
    
    // See --> "ListViewModel.swift"
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var showingAlert = false // this is for our alertview.
    @State var isEditing = false
    @State var isModal: Bool = false
    
    /**
     Start Body
     */
    var body: some View {
        
        
        ZStack {
            if listViewModel.items.isEmpty { // if there are no items, run this code.
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                    .environmentObject(listViewModel)
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
                    NavigationLink("➕", destination: AddView().environmentObject(listViewModel))
                }
        )
    }
    
    
}
