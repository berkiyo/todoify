import Foundation

/**
 The ItemModel package -- part of the MVVM integration
 */

// Immutable Struct - keep them let.
struct ItemModel: Identifiable, Codable {
    let id: String              // id
    let title: String           // name of streak
    var isCompleted: Bool       // streak completed status
    var theColor: Int           // the color picked (array of 8 elements)
    
    
    // init
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, theColor: Int) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.theColor = theColor
    }
    
    // update the items
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, theColor: theColor)
    }
}
