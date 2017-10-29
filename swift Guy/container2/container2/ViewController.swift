//
//  ViewController.swift
//  container2
//
//  Created by Johnny_L on 2017/8/30.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func home(_ sender: Any)
    {
        let myView = self.storyboard?.instantiateViewController(withIdentifier: "123") as! ViewController
        self.present(myView, animated: true, completion: nil)
    }
    
    @IBAction func changeColor(_ sender: Any)
    {
        if self.view.backgroundColor == UIColor.white
        {
            self.view.backgroundColor = UIColor.black
        }
        else
        {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func help(_ sender: Any)
    {
        let alert = UIAlertController(title: "Alert", message: "Here is the help that you need!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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

