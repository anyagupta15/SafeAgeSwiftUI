import SwiftUI
import Firebase
import FirebaseFirestore
class HealthDataFirebaseManager: ObservableObject {
    @Published var healthkitfirebase: [healthdata] = []
    var documentIDManager: DocumentIDManager // Remove @EnvironmentObject declaration
    
    init(documentIDManager: DocumentIDManager) {
        self.documentIDManager = documentIDManager
        //fetchData(documentID: documentIDManager.documentID) // Fetch data using initial document ID
    }
   
    
    func fetchData(documentID: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("userHealthData").document(documentID) // Use provided document ID
        
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data() ?? [:]
                let id = document.documentID
                let bloodPressure = data["bloodPressure"] as? Int ?? 0
                let bloodPressureD = data["bpd"] as? Int ?? 0
                let heartRate = data["heartRate"] as? Int ?? 0
                let sleepString = data["sleep"] as? Int ?? 0
                let stepCountString = data["stepCount"] as? Int ?? 0
                let stress = data["stress"] as? Int ?? 0
                let temperature = data["temperature"] as? Int ?? 0
                
                // Convert string values to Int
                // let sleep = Int(sleepString) ?? 0
                // let stepCount = Int(stepCountString) ?? 0
                
                // Update healthkitfirebase with data from the document
                self.healthkitfirebase = [healthdata(id: id, bloodPressure: bloodPressure, bpd: bloodPressureD, heartRate: heartRate, sleep: sleepString, stepCount: stepCountString, stress: stress, temperature: temperature)]
            } else {
                print("Document does not exist")
            }
        }
    }

    func updateData(id: String, newdata: [String: Any]) {
        let db = Firestore.firestore()
        let docRef = db.collection("userHealthData").document(id)
        print("hello")

        docRef.updateData(newdata) { error in
            if let error = error {
                print("Error updating the document: \(error.localizedDescription)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
