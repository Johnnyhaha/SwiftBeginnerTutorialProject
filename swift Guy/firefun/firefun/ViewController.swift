//
//  ViewController.swift
//  firefun
//
//  Created by Johnny_L on 2017/9/2.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//


//MyTextField.text ,list, snapshot, item, myList,cell.textLabel.text

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    var myList:[String] = []
    var handle:DatabaseHandle?
    var ref:DatabaseReference?
    @IBAction func saveBtn(_ sender: Any)
    {
        //1.----------------------------------------------------------存储。Saving item to database
        if myTextField.text != nil
        {
            ref?.child("list").childByAutoId().setValue(myTextField.text)
            myTextField.text = ""
        }
        
    }

    //3.----------------------------------------------------------显示
    //Setting up our table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = myList[indexPath.row]
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //2.----------------------------------------------------------取出
        ref = Database.database().reference()
        
        handle = ref?.child("list").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String
            {
                self.myList.append(item)
                self.myTableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

