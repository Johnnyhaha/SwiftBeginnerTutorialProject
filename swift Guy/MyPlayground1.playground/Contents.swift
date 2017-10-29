//: Playground - noun: a place where people can play

import UIKit

func mathFunc (myCostumFunc:(_ x:Double,_ y:Double) -> Double,  firstNumber:Double,secondNumber:Double) -> Double
{
    return myCostumFunc(firstNumber,secondNumber)
}

//mathFunc(firstNumber: 10, secondNumber: 5)

func addition(_ number1:Double,_ number2:Double) -> Double
{
    return number1+number2
}

func multiply(_ number1:Double,_ number2:Double) -> Double
{
    return number1*number2
}

func devision(_ number1:Double,_ number2:Double) -> Double
{
    return number1/number2
}

mathFunc(myCostumFunc: addition(_:_:), firstNumber: 10, secondNumber: 10)
mathFunc(myCostumFunc: multiply(_:_:), firstNumber: 10, secondNumber: 10)
mathFunc(myCostumFunc: devision(_:_:), firstNumber: 100, secondNumber: 10)