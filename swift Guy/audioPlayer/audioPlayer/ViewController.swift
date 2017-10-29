//
//  ViewController.swift
//  audioPlayer
//
//  Created by Johnny_L on 2017/8/10.
//  Copyright © 2017年 Johnny. All rights reserved.
//

import UIKit
import AVFoundation //引入AV API ,let you play audio and video
class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer() //variable declare
    
    @IBAction func play(_ sender: Any)
    {
       player.play()
    }
    
    @IBAction func pause(_ sender: Any)
    {
        player.pause()
    }
    
    @IBAction func replay(_ sender: Any)
    {
//        player.stop()
//        player.play()
        player.currentTime = 0
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do
        {
//            let audioPath = Bundle.main.path(forResource:"song" ,ofType:"mp3")
            let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

