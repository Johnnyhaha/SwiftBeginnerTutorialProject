//
//  ViewController.swift
//  storingData
//
//  Created by Johnny_L on 2017/8/14.
//  Copyright © 2017年 Johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
        
        output.text = input.text
        UserDefaults.standard.set(input.text, forKey: "myName")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "myName") as? String

        
        {
            output.text = x
        }
    }


    
    
}

