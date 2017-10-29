//
//  SecondViewController.swift
//  Music Player
//
//  Created by Johnny_L on 2017/9/5.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func play(_ sender: Any)
    {
//        如果音乐不在播放并且选择了歌曲，那么播放
        if audioStufftd == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any)
    {
//        如果歌曲在播放并且选择了歌曲，那么暂停
        if audioStufftd == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    
    @IBAction func prev(_ sender: Any)
    {
//        如果不是第一行歌曲并且选择了歌曲
        if thisSong != 0 && audioStufftd == true
        {
            playThis(thisOne: songs[thisSong-1]) //播放正在播放歌曲的上一行歌曲
            thisSong -= 1 //更新正在播放的歌曲的行数
            label.text = songs[thisSong] //更新曲目显示
        }
        else
        {
//            什么都不做
        }
    }
    
    @IBAction func next(_ sender: Any)
    {
//        如果不是最后一行歌曲并且选择了歌曲
        if thisSong < songs.count-1 && audioStufftd == true
        {
          playThis(thisOne: songs[thisSong+1]) //播放正在播放歌曲的下一行歌曲
            thisSong += 1 //更新正在播放的歌曲的行数
            label.text = songs[thisSong] //更新曲目显示
        }
        else
        {
//            什么都不做
        }
    }
    
    @IBAction func slider(_ sender: UISlider)
    {
        if audioStufftd == true 
        {
            audioPlayer.volume = sender.value
        }
    }
    
    func playThis(thisOne:String)
    {
        do
        {
            //thisOne
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
//            thisSong += 1
            audioPlayer.play()
        }
        catch
        {
            print("ERROR")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = songs[thisSong] //更新曲目显示
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

