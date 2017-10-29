//
//  MyTableViewCell.swift
//  Twitter Feed
//
//  Created by Johnny_L on 2017/8/24.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
