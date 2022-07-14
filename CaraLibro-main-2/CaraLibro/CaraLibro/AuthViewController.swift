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
    
    @IBAction private func tapToCloseKeyboard(_ sender: UITapGestureRecognizer) {
            self.view.endEditing(true)
        }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registrarButton: UIButton!
    @IBOutlet weak var IniciarSesionButton: UIButton!
    @IBOutlet weak var RecuperarPassButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }

    @IBAction func signUpButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
        
    }

    @IBAction func logInButton(_ sender: Any) {
        
        let auth = Auth.auth()
        
        auth.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult, error) in
            if error != nil {
                self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
                return
            }
            self.performSegue(withIdentifier: "logInSegue", sender: nil)
        }
    }
    
    @IBAction func resetPassButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "ResetPassSegue", sender: nil)
    }
}

extension AuthViewController {
    
    private func registerKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func unregisterKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        print(notification.userInfo ?? "sin data")
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        print("teclado desaparece")
    }
 
}
