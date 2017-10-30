//
//  ViewController.swift
//  showPlaceOnMap
//
//  Created by Johnny_L on 2017/9/1.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var myMapView: MKMapView!
    
    
    @IBAction func searchButton(_ sender: Any)
    {
        //1---------------searchBar
        //If you want to use another view as your search controller
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self //searchBar 搜索长条
        //show the searchbar 动画 启动 ，结束后什么也不做
        present(searchController,animated: true,completion: nil)
    }
    
    
    
    //2---------------activityIndicator
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //Ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        //Activity Indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.center = self.view.center
//      the receiver is hidden when the animation is stopped
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        //Hide keyboard
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        
        //3-------------------------------------------Use the text that you type in to searchRequset,and get response and error.
//        搜寻后，停止活动指示器。停止忽略用户交互。
//        如果搜索地点后得到回复，接下来就先移除所有注释。从回复中获得地点中心经纬度，然后设置搜索地点的注释。
        //Creat the search request
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
//        Starts the search and delivers the results to the specified completion handler.
        activeSearch.start { (response, error) in
            
            //        搜寻后，停止活动指示器。停止忽略用户交互。
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response == nil
            {
                print("ERROR")
            }
            else
            {
//                如果搜索地点后得到回复，接下来就先移除所有注释。
                //Remove annotations注释
                let annotations = self.myMapView.annotations
                self.myMapView.removeAnnotations(annotations)
                
//                从回复中获得地点中心经纬度，然后设置搜索地点的注释。
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longtitude = response?.boundingRegion.center.longitude
                
                //Creat annotation
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longtitude!)
                self.myMapView.addAnnotation(annotation)
                
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longtitude!)
                let span = MKCoordinateSpanMake(0.1, 0.1)//搜索地标精度
                let region = MKCoordinateRegionMake(coordinate, span)
//                Changes the currently visible region 
//                 the map is going to display the region
                self.myMapView.setRegion(region, animated: true)
                
            }
        }
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

