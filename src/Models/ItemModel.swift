import Foundation

/**
 The ItemModel package -- part of the MVVM integration
 */

// Immutable Struct - keep them let.            
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    
    // init
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // update the items
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
