import Foundation

/**
 The ItemModel package -- part of the MVVM integration
 */

// Immutable Struct - keep them let.
struct ItemModel: Identifiable, Codable {
    let id: String              // id
    let title: String           // name of streak
    var theDate: Int            // the number of days since streak started
    var isCompleted: Bool       // streak completed status
    var theStartDate: Date      // the start date (i.e. when the streka was first started
    var theColor: Int           // the color picked (array of 8 elements)
    
    
    // init
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, theDate: Int, theStartDate: Date, theColor: Int) {
        self.id = id
        self.title = title
        self.theDate = theDate
        self.isCompleted = isCompleted
        self.theStartDate = theStartDate
        self.theColor = theColor
    }
    
    // update the items
    func updateCompletion() -> ItemModel {
        
        var newDate: Int = theDate
        let timeToLive: TimeInterval = 60*60*24 // 60 seconds * 60 minutes * 24 hours
        
        let isExpired: Bool = Date().timeIntervalSince(theStartDate) >= timeToLive
        
        if isExpired {
            newDate = newDate + 1
            return ItemModel(id: id, title: title, isCompleted: true, theDate: newDate, theStartDate: theStartDate, theColor: theColor)
        } else {
            return ItemModel(id: id, title: title, isCompleted: true, theDate: newDate, theStartDate: theStartDate, theColor: theColor)
        }
    }
}
