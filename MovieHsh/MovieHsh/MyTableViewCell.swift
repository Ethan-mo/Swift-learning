//
//  MyTableViewCell.swift
//  MovieHsh
//
//  Created by Ethan on 2022/04/14.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
