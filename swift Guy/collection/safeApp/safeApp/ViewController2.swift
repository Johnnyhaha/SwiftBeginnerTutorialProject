//
//  ViewController2.swift
//  safeApp
//
//  Created by Johnny_L on 2017/9/3.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController2: UIViewController {

    @IBAction func action(_ sender: UIButton)
    {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "segue2", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(Auth.auth().currentUser?.email)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
