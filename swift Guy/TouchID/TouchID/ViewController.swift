//
//  ViewController.swift
//  TouchID
//
//  Created by Johnny_L on 2017/8/26.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBAction func action(_ sender: Any)
    {
        let context:LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need your TouchID", reply: { (wasSuccessful, error) in
                if wasSuccessful
                {
                     print("WAS A SUCCESS")
                }
                else
                {
                    print("NOT LOGGED IN")
                }
            })
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

