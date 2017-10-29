//
//  ViewController.swift
//  PoemOfTheDay
//
//  Created by Johnny_L on 2017/8/29.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
//support social networking services
import Social

class ViewController: UIViewController {

    @IBAction func buttonAction(_ sender: Any)
    {
        //Alert
        let alert = UIAlertController(title: "share", message: "share the poem of the day!", preferredStyle: .actionSheet)
        
        //First action
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            
//            print("SUCCESS")
            
            //check if a service account, such as Twitter, is set up and reachable
            //Check if your iphone have the app of Twitter or Facebook with social networking services
            
            
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText("Poem of the day")
                post.add(UIImage(named:"img.png"))
                
                self.present(post, animated: true, completion: nil)
            }
            else
            {
                self.showAlert(service: "Facebook")
            }
        }
        
        //Second action
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            
            //            print("SUCCESS")
            
            //Checking if user is connected to Twitter
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText("Poem of the day")
                post.add(UIImage(named:"img.png"))
                
                self.present(post, animated: true, completion: nil)
            }
            else
            {
                self.showAlert(service: "Twitter")
            }
        }
        
        //Third action
        //Cancel button
        let actionThree = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        
        //Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        
        //Present alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(service:String)
    {
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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

