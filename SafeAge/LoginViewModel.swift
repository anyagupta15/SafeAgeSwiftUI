//
//  LoginViewModel.swift
//  SafeAge
//
//  Created by user1 on 26/02/24.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import Firebase

class LoginViewModel: ObservableObject{
    @Published var nonce = ""
    
    func aunthenticate(credential: ASAuthorizationCredential){
        guard let token = credential.identityToken else{
            print("error with firebase")
            return
        }
        
        guard let tokenString = String(data: token, encoding: .utf8) else{
            print("error with token")
            return
        }
        let firebaseCredential  = OAUTHProvider.credential(withProviderID:"apple.com", idToken: tokenString,rawNonce: nonce)
        Auth.auth().signIn(with: firebaseCredential){(result,err) in
            if let error = err{
                print(error.localizedDescription)
                return
            }
            print("Logged in ")
            
        }
    }
    
}

 func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    String(format: "%02x", $0)
  }.joined()

  return hashString
}


func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  var randomBytes = [UInt8](repeating: 0, count: length)
  let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
  if errorCode != errSecSuccess {
    fatalError(
      "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
    )
  }

  let charset: [Character] =
    Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")

  let nonce = randomBytes.map { byte in
    // Pick a random character from the set, wrapping around if needed.
    charset[Int(byte) % charset.count]
  }

  return String(nonce)
}

    
