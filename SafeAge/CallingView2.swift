import SwiftUI

struct CallingView2: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Who do you want to call?")
                .padding(.top,70)
                .bold()
                .font(.system(size: 30))
            // Second Row
            HStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 180)
                    .foregroundColor(Color.green.opacity(0.8))
                    .padding(.top,5)
                    .overlay(
                        VStack {
                            Image("bitmoji")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .padding(.top,30)
                            Text("Rohan")
                                .font(.system(size: 18))
                            
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
                    .frame(height: 180)
                    .foregroundColor(Color.purple.opacity(0.8))
                    .padding(.top,5)
                    .overlay(
                        VStack {
                            Image("bitmoji3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .padding(.top,30)
                            Text("Amit")
                                .font(.system(size: 18))
                            
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
                    .frame(height: 180)
                    .foregroundColor(Color.yellow.opacity(0.8))
                    .overlay(
                        VStack {
                            Image("bitmoji4")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .padding(.top,30)
                            Text("Priya")
                                .font(.system(size: 18))
                            
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
                    .frame(height: 180)
                    .foregroundColor(Color.gray.opacity(0.8))
                    .overlay(
                        VStack {
                            Image("ambulance")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .padding()
                            Text("Ambulance")
                                .font(.system(size: 18))
                            
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
        .navigationBarHidden(true)
    }
}

struct CallingView2_Previews: PreviewProvider {
    static var previews: some View {
        CallingView2()
    }
}

