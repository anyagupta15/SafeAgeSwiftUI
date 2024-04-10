import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "recording", withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundPlay: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            SoundManager.instance.playSound()
            return Alert(title: Text("Sound Played"), message: Text("The sound has been played"), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            self.showAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SoundPlay()
    }
}
