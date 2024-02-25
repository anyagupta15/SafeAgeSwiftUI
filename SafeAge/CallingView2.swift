import SwiftUI

struct CallingView2: View {
    var body: some View {
        VStack(spacing: 10) {
            // Second Row
            HStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 150)
                    .foregroundColor(Color.green.opacity(0.8))
                    .overlay(
                        VStack {
                            Image("bitmoji")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                                                        guard let phoneNum = URL(string: "tel://1-123-456-7890") else { return }
                                                                        UIApplication.shared.open(phoneNum)
                                                                    }) {
                                                                        Image(systemName: "phone.fill")
                                                                    }
                        }
                    )
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 150)
                    .foregroundColor(Color.purple.opacity(0.8))
                    .overlay(
                        VStack {
                            Image("bitmoji3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                                                        guard let phoneNum = URL(string: "tel://1-123-456-7890") else { return }
                                                                        UIApplication.shared.open(phoneNum)
                                                                    }) {
                                                                        Image(systemName: "phone.fill")
                                                                    }
                        }
                    )
            }
            
            // Third Row
            HStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 150)
                    .foregroundColor(Color.yellow.opacity(0.8))
                    .overlay(
                        VStack {
                            Image("bitmoji4")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                                                        guard let phoneNum = URL(string: "tel://1-123-456-7890") else { return }
                                                                        UIApplication.shared.open(phoneNum)
                                                                    }) {
                                                                        Image(systemName: "phone.fill")
                                                                    }
                        }
                    )
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 150)
                    .foregroundColor(Color.gray.opacity(0.8))
                    .overlay(
                        VStack {
                            Image("ambulance")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                                                        guard let phoneNum = URL(string: "tel://1-123-456-7890") else { return }
                                                                        UIApplication.shared.open(phoneNum)
                                                                    }) {
                                                                        Image(systemName: "phone.fill")
                                                                    }
                        }
                    )
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

struct CallingView2_Previews: PreviewProvider {
    static var previews: some View {
        CallingView2()
    }
}

