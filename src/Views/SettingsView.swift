import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        // About View
                        NavigationLink { AboutView() } label: {
                            Text("🧐 About Onelist")
                        }
                        // Feedback Hyperlink (Email)
                        Link("✉️ Give Feedback", destination: URL(string: "mailto:qwerty@tekbyte.net")!)
                        
                        
                        // Review prompt
                        Button("⭐️ Leave a review") {
                            requestReview()
                        }
                        
                    }
                }
            }
        }
    }
}
