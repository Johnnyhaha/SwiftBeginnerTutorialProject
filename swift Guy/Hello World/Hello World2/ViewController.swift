//
//  ViewController.swift
//  Hello World2
//
//  Created by Johnny_L on 2017/8/11.
//  Copyright © 2017年 Johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBAction func action(_ sender: Any)
    {
        output.text = "Hello," + (input.text)!
        
        
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

