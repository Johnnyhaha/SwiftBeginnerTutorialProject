//
//  ViewController.swift
//  imageSaving
//
//  Created by Johnny_L on 2017/8/24.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Encording
        let image = UIImage(named: "dog.jpeg")
        let imageData:NSData = UIImagePNGRepresentation(image!)! as NSData
        
//        print(imageData)
        
        //Saved image
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        
        //Decode
        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
        myImageView.image = UIImage(data: data as Data)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

