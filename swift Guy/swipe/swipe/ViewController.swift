//
//  ViewController.swift
//  swipe
//
//  Created by Johnny_L on 2017/8/30.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Design the Segue
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(leftSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        performSegue(withIdentifier: "swipeLeft", sender: self)
    }
    


}

// Choose the right segue by the identifier
//extension UIViewController
//{
//    func swipeAction(swipe:UISwipeGestureRecognizer)
//    {
//        switch swipe.direction.rawValue {
//        case 1:
//            performSegue(withIdentifier: "swipeRight", sender: self)
//        case 2:
//            performSegue(withIdentifier: "swipeLeft", sender: self)
//        default:
//            break
//        }
//    }
//}
//
