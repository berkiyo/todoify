import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("Goals", systemImage: "infinity")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .navigationTitle("Infinity")
        .navigationBarTitleDisplayMode(.inline)
    }
}

