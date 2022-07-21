//
//  ResetViewController.swift
//  CaraLibro
//
//  Created by user190977 on 6/24/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ResetViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var recuperarButton: UIButton!
    
    @IBAction private func tapToCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
    
