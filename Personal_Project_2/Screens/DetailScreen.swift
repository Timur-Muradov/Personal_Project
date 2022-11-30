//
//  DetailScreen.swift
//  Personal_Project_2
//
//  Created by Тимур Мурадов on 08.10.2022.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class DetailScreen: UIViewController {
    
    @IBOutlet var imageViewDetailScreen: UIImageView!
    @IBOutlet var labelDetailScreen: UILabel!
    
    var item: Item?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewDetailScreen.image = UIImage(named: item?.pic ?? "")
        labelDetailScreen.text = item?.detail
        
        
    }
    
    
    
    @IBAction func buttonStartWorkout() {
        
        let path = Bundle.main.path(forResource: item?.nameVideoFile ?? "", ofType:"mp4") ?? ""
        let videoURL = URL(fileURLWithPath: path)
        
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
        
        
    }
}


