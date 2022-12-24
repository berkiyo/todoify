/* FILE = ContentView.swift
 AUTHOR = Berk Dogan
 PROJECT = Infinity
 URL = https://github.com/berkiyo/infinity
 */

import SwiftUI

/* Date Extension
 Provided by P. Chauhan (source = https://stackoverflow.com/questions/74374698/streak-builder-app-using-swift-and-swiftui)
*/


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
