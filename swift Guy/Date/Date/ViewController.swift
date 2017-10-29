//
//  ViewController.swift
//  Date
//
//  Created by Johnny_L on 2017/8/17.
//  Copyright © 2017年 Johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        print("\(hour):\(minute):\(second)")
        
        let day  = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        print("\(day).\(month)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

