import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            VStack {
                HStack(spacing: 0) {
                    Text("S")
                        .foregroundColor(.red.opacity(0.8))
                        .font(Font.custom("Baskerville-Bold", size: 60))
                    
                    Text("A")
                        .foregroundColor(.red.opacity(0.8))
                        .font(Font.custom("Baskerville-Bold", size: 60))
                    
                    Text("F")
                        .foregroundColor(.red.opacity(0.8))
                        .font(Font.custom("Baskerville-Bold", size: 60))
                    
                    Text("E")
                        .foregroundColor(.red.opacity(0.8))
                        .font(Font.custom("Baskerville-Bold", size: 60))
                    
                    Text("A")
                        .foregroundColor(.orange.opacity(0.8))
                        .font(Font.custom("Baskerville-Bold", size: 60))
                    
                    Text("G")
                        .foregroundColor(.orange.opacity(0.8))
                        .font(Font.custom("Baskerville-Bold", size: 60))
                    
                    Text("E")
                        .foregroundColor(.orange.opacity(0.8))
                        .font(Font.custom("Baskerville-Bold", size: 60))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
            .background(Color.white)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

