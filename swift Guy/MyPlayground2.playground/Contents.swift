//: Playground - noun: a place where people can play

import UIKit

func chooseFunc (_ shouldMultiply:Bool) -> (Int,Int) -> Int
{
    func addition(_ number1:Int,_ number2:Int) -> Int
    {
        return number1 + number2
    }
    func multiplication(_ number1:Int,_ number2:Int) -> Int
    {
        return number1 * number2
    }
    return shouldMultiply ? multiplication : addition
}

let myFunc = chooseFunc(false)
myFunc(10,10)