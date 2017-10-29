//
//  FirstViewController.swift
//  Music Player
//
//  Created by Johnny_L on 2017/9/5.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import AVFoundation

var songs:[String] = []  //歌曲列表
var audioPlayer = AVAudioPlayer()
var thisSong = 0
var audioStufftd = false

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count //行数为歌曲数
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
//        默认格式 显示每行歌曲
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
//            获得你选择第几行，把路径传递给播放器 路径 —> URL
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row //存储正在播放的歌曲的行数
            audioStufftd = true //已经有歌曲被选择播放过
        }
        catch
        {
            print("ERROR")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gettingSongName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Get the names of all of the songs that we have in the folder
    func gettingSongName()
    {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!) //URL to file/Directory
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
//            loop through
            for song in songPath
            {
                var mySong = song.absoluteString //URL to String
                
                if mySong.contains(".mp3")
                {
//                    print(mySong)
                    let findString = mySong.components(separatedBy: "/")
//                    print(findString[findString.count-1)
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ") //Space
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
//                    print(mySong)
                    songs.append(mySong)
                }
            }
            // Updating the tableview to display all of the songs
            myTableView.reloadData() //?
        }
        catch
        {
            
        }
    }

}

