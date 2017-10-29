//
//  ViewController.swift
//  PeakAndPop
//
//  Created by Johnny_L on 2017/8/29.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    
    //Shows preview
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?
    {
        let previewView = storyboard?.instantiateViewController(withIdentifier: "view2")
        return previewView
    }
    
    //Shows fianl ViewController
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController)
    {
        let finalView = storyboard?.instantiateViewController(withIdentifier: "view3")
        show(finalView!, sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Checking for support. Check if the forcetouch capability of the device is available.iphone 6s 7 6p 7p
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available
        {
            //The view that the controller manages.
            registerForPreviewing(with: self, sourceView: view)
        }
        else
        {
            //iphone se 5s 4s
            print("ISN'T COMPATIBLE")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

