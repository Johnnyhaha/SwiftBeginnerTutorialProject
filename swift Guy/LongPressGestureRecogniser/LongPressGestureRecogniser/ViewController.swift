//
//  ViewController.swift
//  LongPressGestureRecogniser
//
//  Created by Johnny_L on 2017/8/29.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //looks for long-press gestures.
        let longPressGestureRecogn = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(press:)))
        longPressGestureRecogn.minimumPressDuration = 2.0
        //If time >2.0 then gesture is effective
        myMapView.addGestureRecognizer(longPressGestureRecogn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()         // Dispose of any resources that can be recreated.
    }

    //注释函数
    func addAnnotation(press:UILongPressGestureRecognizer)
    {
        if press.state == .began
        {
            //conver the locaton where our finger press to coordinates
            let location = press.location(in: myMapView)
            let coordinates = myMapView.convert(location, toCoordinateFrom: myMapView)
            
            //注释
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            
            annotation.title = "My favorite place"
            annotation.subtitle = "This is my favorite place"
            
            //Adds the specified annotation to the map view
            myMapView.addAnnotation(annotation)
        }
    }

}

