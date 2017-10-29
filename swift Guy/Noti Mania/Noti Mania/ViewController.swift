//
//  ViewController.swift
//  Noti Mania
//
//  Created by Johnny_L on 2017/8/27.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBAction func action(_ sender: Any)
    {
        //Response to a delivered notification.
        let answer1 = UNNotificationAction(identifier: "answer1", title: "365", options: UNNotificationActionOptions.foreground)
        let answer2 = UNNotificationAction(identifier: "answer2", title: "340", options: UNNotificationActionOptions.foreground)
        
        let category = UNNotificationCategory(identifier: "myCategory", actions: [answer1,answer2], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        //1.Created notification 2.Add two options
        let content = UNMutableNotificationContent()
        content.title = "How many days are there in one year?"
        content.subtitle = "Du you know?"
        content.body = "Do you really konw?"
        content.categoryIdentifier = "myCategory"
        content.badge = 1
        
        //Display the notification
        //Trigger the notification after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //Request the authorization to display our notification
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        //Add request to our notification center which handles all of the job of displaying the notification
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    //Called to let your app know which action was selected by the user for a given notification.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
    {
        if response.actionIdentifier == "answer1"
        {
            print("CORRECT")
        }
        else
        {
            print("FALSE")
        }
        
        completionHandler()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Ask for permission at first
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow, error in
        })
        //Set the delegate
        UNUserNotificationCenter.current().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

