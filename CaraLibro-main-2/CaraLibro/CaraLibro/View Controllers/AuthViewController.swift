//
//  AuthViewController.swift
//  CaraLibro
//
//  Created by user190977 on 6/19/22.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var IniciarSesionButton: UIButton!
    @IBOutlet weak var RecuperarPassButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
        }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(IniciarSesionButton)
        Utilities.styleFilledButton2(RecuperarPassButton)
        
    }

    @IBAction func logInButton(_ sender: Any) {
        
        let correo = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let contraseña = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: correo, password: contraseña) { (result, error) in
            
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                let homeViewController =
                    self.storyboard?.instantiateViewController(identifier:
                    Constants.Storyboard.homeViewController) as?
                    HomeViewController

                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}
