//
//  ViewController.swift
//  ImageDownload
//
//  Created by Johnny_L on 2017/8/18.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = URL(string: "http://static.boredpanda.com/blog/wp-content/uploads/2016/11/animal-portraits-sergey-polyushko-5-582b05d084f19__880.jpg")  // should get promise to open the http
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error)  in
            //try to sure if the url can be convert to URL
            
            if (error != nil)
            {
                print("ERROR!")
            }
            else
            {
                var doucmentsDirectory:String?
                
                var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                // get a path return
                
                if paths.count > 0
                {
                    doucmentsDirectory = paths[0]
                    
                    let savePath = doucmentsDirectory! + "/880.jpg" //save path to the image
                    
                    FileManager.default.createFile(atPath: savePath, contents: data, attributes: nil) //save image in default file
                    
                    DispatchQueue.main.async // display our image
                        {
                        self.imageView.image = UIImage(named: savePath)
                       }
                }
                
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

