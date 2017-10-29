//
//  ViewController.swift
//  Alert Fun
//
//  Created by Johnny_L on 2017/8/16.
//  Copyright © 2017年 Johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createAlert(title: "Do you like John", message: "Do you?")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        alert.addAction(UIAlertAction(title: "YES", style: UIAlertActionStyle.default, handler: { (action ) in
            alert.dismiss(animated: true, completion: nil)
            print("YES")
        }))
        
        
        alert.addAction(UIAlertAction(title: "NO", style: UIAlertActionStyle.default, handler: { (action ) in
            alert.dismiss(animated: true, completion: nil)
            print ("NO")
        }))
        
        
            self.present(alert, animated: true, completion: nil)
    }


}

