import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Good day! There are no tasks.")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(40)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add something! 🥳")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .clipShape(Capsule())
                            .background(animate ? Color.blue : Color.accentColor) // change colour
                    }
                )
                .padding(.horizontal, animate ? 40 : 50) // animation
                .clipShape(Capsule())
                .shadow(color: animate ? Color.blue.opacity(0.7) : Color.accentColor.opacity(0.7), 
                        radius: animate ? 30 : 10, 
                        x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, 
                        y: animate ? 50: 30) // shadow
                .scaleEffect(animate ? 1.1: 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return } // making sure we don't call it twice
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            // animation code goes here
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}
