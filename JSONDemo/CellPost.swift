//
//  CellPost.swift
//  JSONDemo
//
//  Created by Rachana Pandit on 18/11/22.
//

import UIKit

class CellPost: UITableViewCell {

    @IBOutlet weak var lblId:UILabel!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblBody:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
