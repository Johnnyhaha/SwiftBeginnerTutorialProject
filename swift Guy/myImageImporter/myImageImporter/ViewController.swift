//
//  ViewController.swift
//  myImageImporter
//
//  Created by Johnny_L on 2017/8/18.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func importimage(_ sender: AnyObject)
    {
        let image = UIImagePickerController()//get the opportunity to pick a image
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary //pick image frome the photolibrary
        
//        image.allowsEditing = false
        
        self.present(image,animated: true)//show the image
        {
         //After it is complete
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
             //try to see if  we can convert it to uiimage
        {
            myImageView.image = image
        }
        else
        {
            // Error message
        }
        self.dismiss(animated: true, completion: nil)//hide after pick
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

