//
//  ViewController.swift
//  collection
//
//  Created by Johnny_L on 2017/8/31.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var myCollectionView: UICollectionView!

    let array:[String] = ["1","2","3","4","5","6","7","8","9","10","1","2","3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        设置图片的显示布局 占屏幕宽度的1/3 - 10。layout.minimumInteritemSpacing = 10
        let itemSize = UIScreen.main.bounds.width/3 - 3 // --------？
        
        
        //grid
        let layout = UICollectionViewFlowLayout()
        //整个图片区域的上左下右与边界的距离
//        layout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
//        每行图片的距离
        layout.minimumInteritemSpacing = 3
//        每列图片的距离
        layout.minimumLineSpacing = 3
        
        myCollectionView.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    //Populate view
//    按照数组的顺序选择对应的图片
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.myImageView.image = UIImage(named: array[indexPath.row] + ".jpg")
        return cell
    }

}

