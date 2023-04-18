/* FILE = OnelistApp.swift
 AUTHOR = Berk Dogan
 PROJECT = Onelist
 URL = https://github.com/berkiyo/onelist
 */

import SwiftUI

@main
struct OnelistApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    // the body
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(listViewModel)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
