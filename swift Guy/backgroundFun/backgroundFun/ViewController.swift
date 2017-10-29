//
//  ViewController.swift
//  backgroundFun
//
//  Created by Johnny_L on 2017/8/24.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            //Process error
        }
        
        let session = AVAudioSession.sharedInstance()
        
        do
        {
           try session.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch
        {
            
        }
        
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

