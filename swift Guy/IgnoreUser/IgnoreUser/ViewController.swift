//
//  ViewController.swift
//  IgnoreUser
//
//  Created by Johnny_L on 2017/8/27.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func action(_ sender: Any)
    {
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let url = URL(string: "https://google.com")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                
            }
            else
            {
                print("SUCCESS")
                DispatchQueue.main.async {
                    UIApplication.shared.endIgnoringInteractionEvents()
                }
            }
        }
        task.resume()
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

