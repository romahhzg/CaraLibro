//
//  ResetViewController.swift
//  CaraLibro
//
//  Created by user190977 on 6/24/22.
//

import UIKit
import Firebase

class ResetViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var recuperarButton: UIButton!
    
    @IBAction private func tapToCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {

        Utilities.styleFilledButton(recuperarButton)
    }
    
    @IBAction func ForgotPassButton(_ sender: Any) {
        
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailTextField.text!) { (error) in
            if error == nil{
                print("Enviando...!")
            }else {
                print("Error - \(String(describing: error?.localizedDescription))")
            }
        }
    }
}
    
