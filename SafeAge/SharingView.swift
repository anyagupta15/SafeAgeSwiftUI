import SwiftUI

struct SharingView: View {
    @State private var isShareSheetPresented = false
    @State private var link = "xDEgLK4WxkTJmrp1edbO"
    @State private var showPopup = false
    
    func shareContent() {
        // Create the message to share
        let message = "Check out this link: \(link)"
        
        // Create an instance of UIActivityViewController
        let activityViewController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        
        // Present the UIActivityViewController
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }


 //  @EnvironmentObject var documentIDManager: DocumentIDManager
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Sharing")
                    .font(.title)
                    .bold()
                
                Text("Paste the following code in the user B device to share data:  ")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            
                               
                               TextField("Paste Link", text: $link)
                                   .textFieldStyle(RoundedBorderTextFieldStyle())
                                   .padding(.horizontal)

                LazyVStack(spacing: 20) {
                    BoxView(imageName: "heart", title: "Keep your health in check", description: "Keep loved ones informed about your condition", color: .green)
                    BoxView(imageName: "lock", title: "Privacy", description: "Share and stop anytime", color: .purple)
                    BoxView(imageName: "bell", title: "Notifications", description: "Get notified with updates", color: .yellow)
                }
                .frame(maxHeight: .infinity)

                Spacer()

                Button(action: {
                    shareContent()
                }) {
                    Label("  Share  ", systemImage: "arrowshape.turn.up.right.circle")
                }
//                .sheet(isPresented: $isShareSheetPresented) {
//                    ShareSheet(activityItems: [URL(string: "xDEgLK4WxkTJmrp1edbO")!])
//                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.top, 0)
            }
            .padding()
        }
    }
}

struct BoxView: View {
    var imageName: String
    var title: String
    var description: String
    var color: Color

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(color)

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .bold()

                Text(description)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(width: 300, height: 150)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        .navigationBarHidden(true)
    }
}

struct SharingView_Previews: PreviewProvider {
    static var previews: some View {
        SharingView()
    }
}
