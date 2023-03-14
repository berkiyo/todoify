import Foundation

/**
 The ItemModel package -- part of the MVVM integration
 */

// Immutable Struct - keep them let.            
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let theDate: String
    let isCompleted: Bool
    
    
    // init
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, theDate: String) {
        self.id = id
        self.title = title
        self.theDate = theDate
        self.isCompleted = isCompleted
    }
    
    // update the items
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, theDate: theDate)
    }
}
