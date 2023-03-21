import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("Goals", systemImage: "infinity")
                }
            AddView()
                .tabItem {
                    Label("Add Task", systemImage: "plus.square")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
