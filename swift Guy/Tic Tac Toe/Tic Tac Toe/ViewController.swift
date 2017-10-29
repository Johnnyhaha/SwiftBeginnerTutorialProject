//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Johnny_L on 2017/8/19.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // CROSS
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[1,2,3],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true

    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject)
    {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true )
        {
            // The first you click display X .Next is O .XOXOXOXOX
            gameState[sender.tag-1] = activePlayer
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        
        // Check every possible chance to win
        
        for combination in winningCombinations
        {
// 1.判断前三个数都相等且不为0才能进入 全为1 则cross won .Or gamestate = activeplayer = 2, naught won
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                // show the result to user
                
                if gameState[combination [0]] == 1
                {
                    label.text = "CROSS HAS WON!"
                }
                else
                {
                    label.text = "NAUGHT HAS WON!"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        
        // 2.DRAW:the third consequence.All of the spaces are taken
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            label.text = "IT WAS A DRAW!"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
        
        
    }
    // After we press the playAgainButton ,every value set to default.
 
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func palyAgain(_ sender: AnyObject)
    {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        // Hide the button and label.
        playAgainButton.isHidden = true
        label.isHidden = true
       
        for i  in 1...9
        {
            // nil: clear all of the button
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
            
            
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

