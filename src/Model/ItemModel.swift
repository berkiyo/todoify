import Foundation

/**
 The ItemModel package -- part of the MVVM integration
 */
struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
