//
//  ViewController.swift
//  CaraLibro
//
//  Created by user190977 on 6/19/22.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
        }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contraseñaTextField: UITextField!
    @IBOutlet weak var registrarButton: UIButton!
    @IBOutlet weak var IniciarSesionButton: UIButton!
    @IBOutlet weak var RecuperarPassButton: UIButton!
    override func viewDidLoad(){
        super.viewDidLoad()
        
      
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if let email = emailTextField.text, let  contraseña = contraseñaTextField.text {

            Auth.auth().singIn(withEmail: email, contraseña: contraseña {
            (result, error)in

        if let result = result, error == nil {
            
            self.navigationController?.pushViewController(RegisterViewController(email:result.user.email|, provider: .basic), animated: true)
            
        } else{
            let alertController = UIAlertController(tittle: "Error", message:
                    "Se ha producido un error registrando el usuario",
                    preferredStyle: .alert)
                            
                                                    
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            
            self.present(alertController, animated: true, completion:
                            nill)
            }
        }
    
    @IBAction func logInButton(_ sender: Any) {
    }
}



