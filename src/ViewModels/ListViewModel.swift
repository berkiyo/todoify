import SwiftUI

class ListViewModel: ObservableObject {
    // @State can only be used in a View, not a class.
    
    @Published var items: [ItemModel] = []
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title!", isCompleted: false),
            ItemModel(title: "The Second!", isCompleted: true),
            ItemModel(title: "The third!", isCompleted: false)
        ]
        
        items.append(contentsOf: newItems) // append new the new files.
    }
    
    // function to delete items from list
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // function to delete items from list
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // function to add items to list
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    // updateItem
    func updateItem(item: ItemModel) {
        // SHORTER + BETTER
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompleted()
        }
    }
}
