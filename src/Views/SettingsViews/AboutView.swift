import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("About Onelist")
                    .font(.title)
                    .bold()
                    .padding()
                
                Text("Onelist is a minimal and easy to use to do list app.")
                    .padding()
                
                Spacer()
                
                Text("Version 1.0")
                    .padding()
                
                Spacer()
                
                Text("Made with ❤️ by Tekbyte.")
                
                Spacer()
                
            }
        }
    }
}
