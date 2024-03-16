//
//  NewDogView.swift
//  SafeAge
//
//  Created by user1 on 16/03/24.
//

import SwiftUI

struct NewDogView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newDog = ""
    
    var body: some View {
        VStack{
            TextField("Dog", text: $newDog)
            
            Button{
                dataManager.addDog(dogBreed: newDog)
                
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
}
#Preview {
    NewDogView()
}
