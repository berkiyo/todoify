//
//  ContentView.swift
//  Infinity
//
//  Created by Berk Dogan on 30/10/2022.
//

import SwiftUI

/**
 Item Creator
 */

struct Item {
    let uuid = UUID()
    let value: String
}

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    @AppStorage("countHours") private var countHours = 0
    @AppStorage("countMinutes") private var countMinutes = 0
    @AppStorage("countSeconds") private var countSeconds = 0
    @State private var items = [Item]()
    
    
    /**
     The Settings part of the app. (Gear Icon)
     */
    func buttonSettings() {
        print("Settings Tapped")
    }
    func buttonHelp() {
        print("Help Tapped")
    }
    func buttonAbout() {
        print("About Tapped")
    }
    
    
    /**
     The body of the content.
     */
    var body: some View {
        
        /**
         Everything is encapsulated in the "NavigationView" parameter
         */
        NavigationView {
            
            /**
             The main holder for our content.
             */
            ZStack {
                /**
                 The form itself. This is the main content of the app.
                 */
                Form {
                    Section {
                        Text("Welcome")
                    }
                }
                .navigationTitle("Infinity")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    
                    // This is the main toolbar of the app. 
                    ToolbarItemGroup() {
                        Menu{
                            Button("Settings", action: buttonSettings)
                            Button("Help", action: buttonHelp)
                            Button("About", action: buttonAbout)
                        } label: {
                            Label("Preferences", systemImage: "gearshape")
                        }
                    }
                
                }
                
                /**
                 The button for the app.
                 
                 */
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.items.append(Item(value: "Item"))
                        }, label: {
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 40, height: 30)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        })
                        .cornerRadius(100)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                        .buttonStyle(GradientButtonStyle())
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
