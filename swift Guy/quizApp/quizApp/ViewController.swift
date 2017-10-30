//
//  ViewController.swift
//  quizApp
//
//  Created by Johnny_L on 2017/8/18.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit
 var points:Int = 0
class ViewController: UIViewController {
    
    let questions = ["Favorite pet?","Favorite color?","Where was I born?"]
    let answers = [["dog","cat","bird"],["blue","black","white"],["Beijing","Shanghai","Shenzhen"]]
    
    //variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
   
    
    //label
    @IBOutlet weak var lbl: UILabel!
       
   //button
    @IBAction func action(_ sender: AnyObject)
    {
        if (sender.tag == Int(rightAnswerPlacement)) //选择的按钮和正确值相等
        {
            print("RIGHT!")
            points += 1
        }
        else
        {
            print("WRONG")
        }
        
        if (currentQuestion != questions.count)//如果问题没有问完，继续提问
        {
            newQuestion()
        }
        else
        {
            performSegue(withIdentifier: "showScore", sender: self)
            
    }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    //Function that displays new question
    func newQuestion()
    {
        lbl.text = questions[currentQuestion]
        
        rightAnswerPlacement = arc4random_uniform(3) + 1
        //产生1~3的随机数
        
        //Creat a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3
        {
            //Creat a button 
            button = view.viewWithTag(i) as! UIButton //给每个button设值
            // 012 102 120 button排列方式 0:rightanswerplacement
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
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

