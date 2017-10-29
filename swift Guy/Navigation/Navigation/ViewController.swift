//
//  ViewController.swift
//  Navigation
//
//  Created by Johnny_L on 2017/8/28.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBAction func showMeWhere(_ sender: Any)
    {
        //Defining destination
        let latitude:CLLocationDegrees = 37.760394
        let longitude:CLLocationDegrees = -122.447902
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "My House"
        mapItem.openInMaps(launchOptions: options)
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

