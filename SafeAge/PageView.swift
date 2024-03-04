//
//  PageView.swift
//  SafeAge
//
//  Created by user1 on 15/01/24.
//

import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing: 20) {
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                .cornerRadius(10)
                .padding()
            
            Text(page.name)
                .bold()
                .font(.title)
            
            Text(page.description)
                .font(.subheadline)
                .frame(width: 300)
            
            
            
        }
    }
}


