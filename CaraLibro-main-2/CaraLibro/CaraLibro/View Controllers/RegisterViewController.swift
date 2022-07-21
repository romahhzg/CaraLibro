//
//  HomeViewController.swift
//  CaraLibro
//
//  Created by user190977 on 6/23/22.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidosTextField: UITextField!
    @IBOutlet weak var fotoImagenView: UIImageView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var registrarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()	
        
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        
        Utilities.styleTextField(nombreTextField)
        Utilities.styleTextField(apellidosTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(registrarButton)
        
    }
    
    func validateFields() -> String? {

        if nombreTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            apellidosTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Por favor rellena todos los campos."
        }

    // Comprobamos si la contraseña es segura
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Contraseña no es segura
            return "Asegúrese de que su contraseña tenga al menos 8 caracteres, que contenga un carácter especial y un número"
        }

        return nil
    }
    
    @IBAction private func tapToCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @IBAction func saveBottomAction(_ sender: Any) {
        
        let error = validateFields()
            
            if error != nil {
                // Hay algo mal con los campos, mostrar mensaje de error
                showError(error!)
            }
            
            else {
                
                let nombre = nombreTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let apellidos = apellidosTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let correo = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let contraseña = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                Auth.auth().createUser(withEmail: correo, password: contraseña) { (result, err) in
                    
                    if err != nil {
                        
                        self.showError("Error creando usuario")
                    }
                    else{
                        let db = Firestore.firestore()

                        db.collection("users").addDocument(data: ["nombre":nombre, "apellidos":apellidos, "uid": result!.user.uid]) {(error) in
                            if error != nil {
                                    
                                self.showError("Error al guardar datos de usuario")

                            }
                        }
                            
                        self.transitionToHome()
                    }
                }
            }
    }

    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier:
            Constants.Storyboard.homeViewController) as?
            HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
            
    }
}
