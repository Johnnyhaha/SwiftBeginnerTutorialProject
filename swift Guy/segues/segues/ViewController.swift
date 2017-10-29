//
//  ViewController.swift
//  segues
//
//  Created by Johnny_L on 2017/8/11.
//  Copyright © 2017年 Johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func yes(_ sender: Any)
    {
        performSegue(withIdentifier: "yes", sender: self)
    }
    
    @IBAction func no(_ sender: Any)
    {
        performSegue(withIdentifier: "no", sender: self)
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

