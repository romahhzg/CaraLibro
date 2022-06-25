//
//  HomeViewController.swift
//  CaraLibro
//
//  Created by user190977 on 6/23/22.
//
import UIKit
import FirebaseAuth
import FirebaseFirestore

enum ProviderType: String{
    case basic
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var CerrarSesionButton: UIButton!
    
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var ApellidosTextField: UITextField!
    @IBOutlet weak var fotoImageView: UIImageView!
    
    private let email: String
    private let provider : ProviderType
    private let db = Firestore.firestore()
    
    init(email: String, provider: ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad(){
        super.viewDidLoad()
        
        title = "HOME"
        
        emailLabel.text = email
        providerLabel.text = provider.rawValue
    }
    

    
    @IBAction func saveBottomAction(_ sender: Any) {
        
        view.endEditing(true)

        db.collection("user").document(email).setData([
        "provider":provider.rawValue,
        "nombre":nombreTextField.text ?? "",
        "apellidos":ApellidosTextField.text ?? ""])
    }
    
    @IBAction func CerrarSesionButtonAction(_ sender: Any) {
        
        switch provider {
        case .basic:
            do {
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            } catch {
                // Se ha producido un error
            }
        }
    }
}
