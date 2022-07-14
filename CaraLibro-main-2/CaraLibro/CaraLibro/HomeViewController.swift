//
//  HomeViewController.swift
//  CaraLibro
//
//  Created by user190977 on 6/23/22.
//
import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
        
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var ApellidosTextField: UITextField!
    @IBOutlet weak var fotoImageView: UIImageView!
    

    @IBAction private func tapToCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    

    
    @IBAction func saveBottomAction(_ sender: Any) {
        
        Service.signUpUser(email: emailTextField.text!, password: passwordTextField.text!, name: nombreTextField.text!, namelastname: ApellidosTextField.text!, onSuccess: {
            self.performSegue(withIdentifier: "logInSegue", sender: nil)
        }) {(error) in
            self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
        }

        self.performSegue(withIdentifier: "logInSegue", sender: nil)
    }
}


