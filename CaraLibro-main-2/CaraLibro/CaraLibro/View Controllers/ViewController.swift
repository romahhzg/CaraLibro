//
//  ViewController.swift
//  CaraLibro
//
//  Created by user190977 on 7/17/22.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?

    var videoPlayerLayer: AVPlayerLayer?
    
    @IBOutlet weak var RegistrarseButton: UIButton!
    @IBOutlet weak var IniciarSesionButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool){

        setUpVideo()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(RegistrarseButton)
        Utilities.styleFilledButton2(IniciarSesionButton)
        
    }
    
    func setUpVideo(){

        let bundlePath = Bundle.main.path(forResource:"friends", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        //Crear una url a partir de ella
        let url = URL(fileURLWithPath: bundlePath!)

        //Crear el elemento del reproductor de video
        let item = AVPlayerItem(url: url)

        //Crear el player
        videoPlayer = AVPlayer(playerItem: item)

        //Crear el layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)

        //Ajustar el tamaño y el marco
        videoPlayerLayer?.frame = CGRect(x:
            -self.view.frame.size.width*1.5, y: 0,width:
                self.view.frame.size.width*4, height:
                self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at:0)

        videoPlayer?.playImmediately(atRate: 0.3)
    }
}
