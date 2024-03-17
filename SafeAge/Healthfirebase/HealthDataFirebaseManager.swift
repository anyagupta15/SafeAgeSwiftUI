//
//  HealthDataFirebaseManager.swift
//  SafeAge
//
//  Created by user1 on 17/03/24.
//

import SwiftUI
import FirebaseFirestore

class HealthDataFirebaseManager: ObservableObject {
    @Published var healthkitfirebase: [healthdata] = []
    
    init(){
        fetchData()
    }
    
    func fetchData() {
        let db = Firestore.firestore()
        db.collection("userHealthData").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            self.healthkitfirebase = documents.map { queryDocumentSnapshot -> healthdata in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID // Get the document ID
                let bloodPressure = data["bloodPressure"] as? String ?? ""
                let heartRate = data["heartRate"] as? String ?? ""
                let sleep = data["sleep"] as? String ?? ""
                let stepCount = data["stepCount"] as? String ?? ""
                let stress = data["stress"] as? String ?? ""
                let temperature = data["temperature"] as? String ?? ""
                return healthdata (id: id, bloodPressure: bloodPressure, heartRate: heartRate, sleep: sleep, stepCount: stepCount, stress: stress, temperature: temperature)
            }
        }
    }


    func updateData(id: String, newdata: [String: Any]) {
        let db = Firestore.firestore()
        let docRef = db.collection("userHealthData").document(id)

        docRef.updateData(newdata) { error in
            if let error = error {
                print("Error updating the document: \(error.localizedDescription)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
