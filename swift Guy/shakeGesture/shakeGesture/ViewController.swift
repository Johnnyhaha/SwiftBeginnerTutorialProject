//
//  ViewController.swift
//  shakeGesture
//
//  Created by Johnny_L on 2017/8/14.
//  Copyright © 2017年 Johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let images = ["4","1","2","3"]
    var currentImage = 0
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake
        {
            print("SHAKE")
            imageView.image = UIImage(named: images[currentImage] + ".jpeg")
            if (currentImage == images.count-1)
            {
                currentImage = 0
            }
            else
            {
                currentImage += 1
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

