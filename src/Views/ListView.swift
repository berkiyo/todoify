import SwiftUI

// ListView
struct ListView: View {
    
    // See --> "ListViewModel.swift"
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var showingAlert = false // this is for our alertview.
    
    // Checking if 24 hours has lapsed
    // tbc
    
    /* 
     define variables for menu:
     */
    @State var isModal: Bool = false
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
                    /* start menu here:
                    
                     - How to guide
                     - Change app icon
                     - About
                     - Infinity premium
                     - Feedback
                     - Rate on app store
                     
                     */
                    NavigationLink("✍️", destination: AddView())
                    /**
                     Menu Buttons
                     */
                    Menu("⚙️") {
                       NavigationView {
                           NavigationLink {
                               AddView()
                           } label: {
                               Text("❓ How to Guide #1")
                           }
                           Button("❓ How To Guide", action: menuGuide)
                           Button("📱 Change App Icon", action: menuAppIcon)
                           Button("🧐 About", action: menuAbout)
                           Button("💎 Infinity Premium", action: menuPremium)
                           Button("✉️ Feedback", action: menuFeedback)
                           Button("⭐️ Rate on App Store", action: menuRate)
                       }
                   }          
                }
        )
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    /**
     Menu Functionality
     */
    func menuGuide() {
        struct PLACEHOLDER: View {
            var body: some View {
                Text("Hello World")
            }
        }
    }
    func menuAppIcon() {}
    func menuAbout() {}
    func menuPremium() {}
    func menuFeedback() {}
    func menuRate() {}
}
