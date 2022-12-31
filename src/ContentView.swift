/* FILE = ContentView.swift
 AUTHOR = Berk Dogan
 PROJECT = Infinity
 URL = https://github.com/berkiyo/infinity
 */

import SwiftUI

/**
 Struct for Tracking Activities
 */
struct Task: Identifiable {
    let id = UUID() // the identifier
    let name: String // the name of the task
    var isCompleted: Bool = false // whether it is completed or not
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            Text("ContentView")
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    }
   
}
