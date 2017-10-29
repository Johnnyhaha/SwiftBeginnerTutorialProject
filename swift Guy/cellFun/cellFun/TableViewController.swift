//
//  TableViewController.swift
//  cellFun
//
//  Created by Johnny_L on 2017/8/31.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit


var pets = ["dog","cat","rabbit"]
var petDesc = ["Dog is an animal that has four legs","Cat is an animal that likes to eat fish","Rabbit is an animal that likes to jump around"]
var myIndex = 0

class TableViewController: UITableViewController {

   
    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pets.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

         cell.textLabel?.text = pets[indexPath.row]

        return cell
    }
 

    // myIndex :select which row and then segue to the viewcontroller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
        
    }
}
