import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Good day! There are no tasks.")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(40)
                NavigationLink(
                    destination: AddView().environmentObject(listViewModel),
                    label: {
                        Text("Add something! 📝")
                            .padding(.all, 16)
                            .background(animate ? Color.blue : Color.accentColor) // change
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(10.0, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                    }
                )
                .padding(.horizontal, animate ? 40 : 50)
                .scaleEffect(animate ? 1.1: 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar(.hidden, for: .navigationBar)
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
