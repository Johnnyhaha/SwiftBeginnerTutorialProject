//
//  ViewController.swift
//  stopwatch
//
//  Created by Johnny_L on 2017/8/11.
//  Copyright © 2017年 Johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0
    var timer = Timer()
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBAction func start(_ sender: UIButton)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }
    @IBAction func pause(_ sender: UIButton)
    {
        timer.invalidate()
    }
    @IBAction func reset(_ sender: UIButton)
    {
        timer.invalidate()
        time = 0
        lbl.text = ("0")
    }

   func  action()
   {
    time += 1
    lbl.text = String(time)
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

