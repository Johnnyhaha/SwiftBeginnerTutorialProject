//
//  ViewController.swift
//  buttonDemo
//
//  Created by Johnny_L on 2017/8/31.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonO: UIButton!
    
    @IBAction func button(_ sender: Any)
    {
        buttonO.isHidden = true 
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

