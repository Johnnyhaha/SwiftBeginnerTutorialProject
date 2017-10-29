//
//  ViewController.swift
//  adMoney
//
//  Created by Johnny_L on 2017/9/3.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var myBanner: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Request
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        //Set up ad
        myBanner.adUnitID = "ca-app-pub-9146539035038995/1170616993"
        
        myBanner.rootViewController = self
        myBanner.delegate = self
        
        myBanner.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

