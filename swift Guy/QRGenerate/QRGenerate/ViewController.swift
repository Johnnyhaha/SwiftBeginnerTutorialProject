//
//  ViewController.swift
//  QRGenerate
//
//  Created by Johnny_L on 2017/9/5.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func button(_ sender: Any)
    {
//        text data filter img image
        if let myString = myTextField.text
        {
//            ascii
            let data = myString.data(using: .ascii, allowLossyConversion: false)
//            An image processor
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            
//            Returns a CIImage objec
            let img = UIImage(ciImage: (filter?.outputImage)!)
            
            myImageView.image = img
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

