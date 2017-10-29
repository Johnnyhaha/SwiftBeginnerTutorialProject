//
//  ViewController.swift
//  piackerView
//
//  Created by Johnny_L on 2017/8/31.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var pickerView: UIPickerView!
    
    let foods = ["Apples","Bananas","Corn","Beans","Tomatoes"]
    
    
    //Make the pickerView operational
    //How many sections in one row
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1 //1列
    }
    
    //Define what text should be in each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return foods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return foods.count //5行
    }
    
    //Display the selected row in our label
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        label.text = foods[row]
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

