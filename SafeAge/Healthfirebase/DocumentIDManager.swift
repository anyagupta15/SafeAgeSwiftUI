//
//  DocumentIDManager.swift
//  SafeAge
//
//  Created by user1 on 18/03/24.
//

import SwiftUI
class DocumentIDManager: ObservableObject {
    @Published var documentID: String = "Enter document id"
    init() {
            // Retrieve the saved document ID from UserDefaults, or use a default value if it's not available
            self.documentID = UserDefaults.standard.string(forKey: "documentID") ?? ""
        }
    
}
