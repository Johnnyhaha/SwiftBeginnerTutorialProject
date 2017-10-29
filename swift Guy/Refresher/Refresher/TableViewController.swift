//
//  TableViewController.swift
//  Refresher
//
//  Created by Johnny_L on 2017/8/20.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array:[Int] = [1,2,3]
    var refresher: UIRefreshControl!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        //下拉更新功能激活 调用
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        
        // 2.Use the UIRefreshControl to refresh the UI
        
        refresher.addTarget(self, action: #selector(TableViewController.populate), for: UIControlEvents.valueChanged)
        
        //更新：增加在原数组后
        tableView.addSubview(refresher)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    // 3.Display the UI ,the array
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
  
        return cell
    }
    // 1.refresh data
    func populate()
    {
        //append:附加上1～1000
        for i in 1...1000
        {
            array.append(i)
        }
        
        //重载数据 停止更新 
        tableView.reloadData()
        refresher.endRefreshing()
        
    }
    
}
