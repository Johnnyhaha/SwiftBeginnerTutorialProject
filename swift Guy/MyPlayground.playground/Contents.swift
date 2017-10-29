//: Playground - noun: a place where people can play

import UIKit


func generateRandemNumber(_ from:Int, _ to:Int, _ qut:Int?) -> [Int]//qut :quantity
{
    var myRandemNumbers = [Int]() //All our generated numbers
    var numberOfNumbers = qut //How many numbers to generate
    
    let lower = UInt32(from) //Generate from this number
    let higher = UInt32(to+1) //--------------------------To this one 0~to
    
    if numberOfNumbers == nil || numberOfNumbers! > (to - from) + 1
    {
        numberOfNumbers = (to-from) + 1
    }
    
    //while the count of myRandemNumbers != quantity that we need ,keep generate new randem numbers.
    while myRandemNumbers.count != numberOfNumbers
    {
        let myNumber = arc4random_uniform(higher-lower)+lower
        
        //Check if the number is exists in our array.If it is false,then append it in our array
        if !myRandemNumbers.contains(Int(myNumber))
        {
            myRandemNumbers.append(Int(myNumber))
        }
    }
    return myRandemNumbers
}

generateRandemNumber(3, 5, nil)
//generateRandemNumber(10, 20, 3)
