/* FILE = ContentView.swift
 AUTHOR = Berk Dogan
 PROJECT = Infinity
 URL = https://github.com/berkiyo/infinity
 */

import SwiftUI
import StoreKit
import CoreData

struct ContentView: View {
    
    // Properties
    @State private var showingAddTodoView: Bool = false
    
    
    // Body
    var body: some View {
        NavigationView {
            List (0 ..< 5) {
                item in Text("Hello World")
            } // List
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: self.showingAddTodoView.toggle()  )) {
                Image(systemName: "plus")
            }
            .sheet(isPresented: $showingAddTodoView) {
                AddTodoView()
            }
        }
    }
}
