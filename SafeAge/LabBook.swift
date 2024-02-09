//
//  LabBook.swift
//  SafeAge
//
//  Created by user1 on 17/01/24.
//

import SwiftUI

struct LabBook: View {
    @State private var searchText: String = ""
    @State private var isDateAndTimeActive: Bool = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16)
            {
                HStack{
                Text("                 Lab")
                    .font(.title)
                    .bold()
                Text("Booking")
                    .font(.title)
                    .bold()
                    .padding(.bottom,2)
                    
                }
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    TextField("Search labs.", text: $searchText)}
                                        .padding(12) // Increase padding
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(10)
                                        .font(.system(size: 18)) // Increase font size

                
                //MapView()
                Image("Map")
                    .resizable()
                    .cornerRadius(10)
                    .border(Color.blue, width: 2)
                    .frame(width: 330, height: 200)
                    .padding()

                Text("Suggested Labs")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom,2)

                // First button with image, lab name, and ratings
                NavigationLink(destination: manualFilling()) {
                                        SavedLabButton(imageName: "lalpath", labName: "Dr Lal PathLabs", centerType: "Diagnostic Test Center", starRating: 5)
                                    }

                                    NavigationLink(destination: manualFilling()) {
                                        SavedLabButton(imageName: "pharmeasy", labName: "PharmEasy", centerType: "Diagnostic Test Center", starRating: 4)
                                    }

                                    NavigationLink(destination: manualFilling()) {
                                        SavedLabButton(imageName: "red", labName: "Redcliffe Labs", centerType: "Diagnostic Test Center", starRating: 3)
                                    }
                 


                // Three buttons with images on the left
            }
            .padding()
        }
    }
}

struct MapView: View {
    var body: some View {
        // Placeholder MapView
        Text("Map goes here")
            .frame(height: 200)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(16)
    }
}

struct LabBook_Previews: PreviewProvider {
    static var previews: some View {
        LabBook()
    }
}

// Custom button with image on the left
struct CustomButton: View {
    var imageName: String
    var buttonText: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: imageName)
                .foregroundColor(.blue)
            Text(buttonText)
                .foregroundColor(.blue)
                .fontWeight(.bold)
        }
        .padding(12)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

// Custom button for Saved Labs with image, lab name, and ratings
struct SavedLabButton: View {
    var imageName: String
    var labName: String
    var centerType: String
    var starRating: Int

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 80)
                .cornerRadius(10)
                .padding(.leading, -50)
            

            VStack(alignment: .leading, spacing: 8) {
                Text(labName)
                    .font(.headline)
                    .fontWeight(.bold)

                Text(centerType)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack(spacing: 4) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < starRating ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
        .padding(16)
        .frame(width: 350, height: 100)
        .background(Color(hex: "F7EDE2"))
        .cornerRadius(10)
    }
}

// Extension to convert hex color to SwiftUI Color
extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}


