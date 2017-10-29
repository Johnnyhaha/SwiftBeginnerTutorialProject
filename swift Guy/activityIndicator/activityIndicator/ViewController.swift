//
//  ViewController.swift
//  activityIndicator
//
//  Created by Johnny_L on 2017/8/31.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activityIdicator:UIActivityIndicatorView = UIActivityIndicatorView()
    @IBAction func start(_ sender: Any)
    {
        activityIdicator.center = self.view.center
        activityIdicator.hidesWhenStopped = true
        activityIdicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIdicator)
        
        activityIdicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    @IBAction func stop(_ sender: Any)
    {
        activityIdicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
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

