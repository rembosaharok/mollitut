struct ContentView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(isAnimating ? .red : .blue)
                .frame(width: 200, height: 200)
            
            Button("Animate") {
                withAnimation {
                    isAnimating.toggle()
                }
            }
        }
    }
}
