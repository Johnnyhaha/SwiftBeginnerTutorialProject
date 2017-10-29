//
//  ViewController.swift
//  JASON fun
//
//  Created by Johnny_L on 2017/8/22.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let url = URL(string: "http://api.fixer.io/latest")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("ERROR!")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        // Array
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//                        print(myJson)
                        
                        if let rates = myJson["reates"] as? NSDictionary
                        {
//                            print (rates)
//                            if let currency = rates["GBP"]
                             if let currency = rates["NOK"]
                            {
                                print(currency)
                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

