//
//  MyTableViewCell.swift
//  Table
//
//  Created by Ethan on 2022/04/13.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
