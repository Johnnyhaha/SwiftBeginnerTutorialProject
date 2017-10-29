//
//  ViewController.swift
//  Core  Data Fun
//
//  Created by Johnny_L on 2017/8/20.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // Declaration
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Storing core data
        let appDalegate = UIApplication.shared.delegate as! AppDelegate
        
        // To work with core data: persistenContainer.Get the delegate.
        let context = appDalegate.persistentContainer.viewContext
        
   /*
        //        // 1.input the data
        //        // Convert newUser to context
        //        // ["Peter", "Cral", "Sophia", "Johnny"]
        //        // ["Peter123", "he234", "dj23k451", "8678"]
                let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
                //Set the value of the newUser
                newUser.setValue("Johnny", forKey: "username")
                newUser.setValue("8678", forKey: "password")
        
        
                // Save the context
                do
                {
                    try context.save()
                    print("SAVED")
                }
                catch
                {
                    // Process error
                    print("There was an error")
                }
        */

        
        // 2.Output the data
        // Access the data:NSFetchrRequest
        //Retrieve USERS
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
//        request.returnsObjectsAsFaults = false
        
        do
        {
            // Get the data frome the fetch[request]
            let results = try context.fetch(request)
            
            // Show that there exist some data
            if results.count > 0
            {
                // Pull out each of the object in the results array one at a time
                for result in results as! [NSManagedObject]
                {
                    // Set value and convert it into String
                    // Append username and password to the array
                    if let username = result.value(forKey: "username") as? String
                    {
//                        if username == "Johnny"
//                        {
//                            result.setValue("The cool one", forKey: username)
//                            do
//                            {
//                                try context.save()
//                            }
//                            catch
//                            {
//                                
//                            }
                    

//                        }
                    print(username)
//                        usernameArr.append(username)
                        
                    }
//                    if let password = result.value(forKey: "password") as? String
//                    {
//                        passwordArr.append(password)
//                    }

                }
                
//                print(usernameArr)
//                print(passwordArr)
            }
        }
        catch
        {
            // Process error
        }
    
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

