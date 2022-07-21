//
//  HomeViewController.swift
//  CaraLibro
//
//  Created by user190977 on 7/16/22.
//

import UIKit

class HomeViewController: UIViewController {
        
    @IBOutlet weak var fotoImagenView: UIImageView!
    
    @IBOutlet weak var portadaImagenView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fotoImagenView.layer.cornerRadius = fotoImagenView.bounds.height / 3
        fotoImagenView.clipsToBounds = true
        
    }
    
}
