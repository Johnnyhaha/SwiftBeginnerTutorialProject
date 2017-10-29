//
//  ViewController.swift
//  YouTubeEmbed
//
//  Created by Johnny_L on 2017/8/17.
//  Copyright © 2017年 Johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getVideo(videoCode: "_e2q1oDGPMs")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getVideo(videoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")

        myWebView.loadRequest(URLRequest(url:url!))
    }

}

