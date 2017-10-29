//
//  ViewController.swift
//  Gyroscope
//
//  Created by Johnny_L on 2017/8/28.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        motionManager.gyroUpdateInterval = 0.2
        
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                if myData.rotationRate.x > 2
                {
                    print("YOUR TILTED YOUR DEVICE")
                }
//                print(myData.rotationRate) 
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

