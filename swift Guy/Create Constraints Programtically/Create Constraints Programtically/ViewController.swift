//
//  ViewController.swift
//  Create Constraints Programtically
//
//  Created by Johnny_L on 2017/8/29.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myButton = UIButton()
    var buttonCons:[NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Avoid a conflict in constraints.Remove the constraints that could a conflict
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        myButton.backgroundColor = UIColor.orange
        myButton.setTitle("PASS ME!", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(myButton)
        
        //Constraints for Button
        let topConstraint = myButton.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraint = myButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
//        let leftConstraint = myButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let leftConstraint = myButton.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightConstraint = myButton.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        
        buttonCons = [topConstraint, bottomConstraint, leftConstraint, rightConstraint]
        NSLayoutConstraint.activate(buttonCons)
        
        myButton.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    func action()
    {
        //deactive the constraints
        NSLayoutConstraint.deactivate(buttonCons)
        
        //Define new constraints
        let buttonHeight = myButton.heightAnchor.constraint(equalToConstant: 200)
        let buttonWidth = myButton.widthAnchor.constraint(equalToConstant: 200)
        let xPlacement = myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let yPlacement = myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        let newButtoncons:[NSLayoutConstraint] = [buttonHeight, buttonWidth, xPlacement, yPlacement]
        
        NSLayoutConstraint.activate(newButtoncons)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

