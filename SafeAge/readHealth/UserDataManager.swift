import SwiftUI
import FirebaseFirestore

class UserDataManager: ObservableObject {
    @Published var userhealthdata: [userHealthData] = []
    
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
            self.userhealthdata = documents.map { queryDocumentSnapshot -> userHealthData in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID // Get the document ID
                let bloodPressure = data["bloodPressure"] as? String ?? ""
                let heartRate = data["heartRate"] as? String ?? ""
                let sleep = data["sleep"] as? String ?? ""
                let stepCount = data["stepCount"] as? String ?? ""
                let stress = data["stress"] as? String ?? ""
                let temperature = data["temperature"] as? String ?? ""
                return userHealthData(id: id, bloodPressure: bloodPressure, heartRate: heartRate, sleep: sleep, stepCount: stepCount, stress: stress, temperature: temperature)
            }
        }
    }

    func addData(abloodPressure: String, aheartRate: String, asleep: String, astepCount: String, astress: String, atemperature: String) {
        let db = Firestore.firestore()
        let data: [String: Any] = [
            "bloodPressure": abloodPressure,
            "heartRate": aheartRate,
            "sleep": asleep,
            "stepCount": astepCount,
            "stress": astress,
            "temperature": atemperature,
            "id": 10
        ]
        db.collection("userHealthData").addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error.localizedDescription)")
            } else {
                print("Document added successfully!")
            }
        }
    }
    
    func updateData(id: String, newData: [String: Any]) {
        let db = Firestore.firestore()
        let docRef = db.collection("userHealthData").document(id)
        
        docRef.updateData(newData) { error in
            if let error = error {
                print("Error updating document: \(error.localizedDescription)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}

