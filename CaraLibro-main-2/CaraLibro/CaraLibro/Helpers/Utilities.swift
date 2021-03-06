//
//  Utilities.swift
//  CaraLibro
//
//  Created by user190977 on 7/17/22.
//

import Foundation
import UIKit

class Utilities{
    
    //  Creamos la linea de fondo
    static func styleTextField(_ textfield:UITextField){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect (x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height:2)
        bottomLine.backgroundColor = UIColor.init(red: 102/255, green: 102/255, blue: 255/255, alpha:1).cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
    }

    //Le aplicamos el relleno
    static func styleFilledButton(_ button:UIButton){
        button.backgroundColor = UIColor.init(red: 102/255, green: 102/255, blue: 255/255, alpha:1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleFilledButton2(_ button:UIButton){
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha:1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    //Le damos estilo redondeado
    static func styleHollowButton(_ button:UIButton){

        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    //Validar contraseña
    static func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
