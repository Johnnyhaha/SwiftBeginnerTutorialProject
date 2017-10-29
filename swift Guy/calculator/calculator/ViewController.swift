//
//  ViewController.swift
//  calculator
//
//  Created by Johnny_L on 2017/9/4.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//
// 如果选择过功能键，bool值为真，屏幕显示为当前所选择数字。如果bool值为假，屏幕显示为之前的数字加上目前的数字。如果按下的是功能键，选择+—-*／，显示+—-*／，并且存储之前的数值和设置运算符。如果选择等号=，显示出之前数值和目前数值的运算值。如果选择C，存储的数值和运算符清零，屏幕显示为空

import UIKit

class ViewController: UIViewController {
   
    var numberOfScreen:Double = 0 //当前屏幕数值
    var previousNumber:Double = 0 //选择运算符前的数值
    var performingMath = false
    var operation = 0 //运算符
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) //数字按钮
    {
//        如果选择过功能键，bool值为真，屏幕显示为当前所选择数字。
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOfScreen = Double(label.text!)!
            performingMath = false
        }
//            如果bool值为假，屏幕显示为之前的数字加上目前的数字。
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOfScreen = Double(label.text!)!
        }
    }
    
    @IBAction func actions(_ sender: UIButton) //功能按钮
    {
//        如果按下的是功能键，选择+—-*／，显示+—-*／，并且存储之前的数值和设置运算符。
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 //Divide
            {
                label.text = "/"
            }
            else if sender.tag == 13 //Multiply
            {
                label.text = "x"
            }
            else if sender.tag == 14 //Minus
            {
                label.text = "-"
            }
            else if sender.tag == 15 //Plus
            {
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
//            如果选择等号=，显示出之前数值和目前数值的运算值。
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOfScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOfScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOfScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOfScreen)
            }
        }
//            如果选择C，存储的数值和运算符清零，屏幕显示为空
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0
            numberOfScreen = 0
            operation = 0
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

