//
//  ViewController.swift
//  CaraLibro
//
//  Created by user190977 on 6/24/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class ViewController: UIViewController {

    @IBOutlet weak var recuperarButton: UIButton!
    
    private let db = Firestore.firestore()
    
    @IBAction func getButtonAction(_ sender: Any) {
        
        db.collection("user").document(email).getDocument (
            (documentSnapshot, error) in

            if let document = documentSnapshot, error == nil {
                if let email = document.get("email") as? String {
                    self.emailLabel = email
                }
            }
        }
    }
}
    
