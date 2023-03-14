import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle") // if else
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
            Text(item.theDate)
        }
        .padding(.vertical, 8)
    }
}
