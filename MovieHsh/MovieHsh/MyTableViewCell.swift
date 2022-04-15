//
//  MyTableViewCell.swift
//  MovieHsh
//
//  Created by Ethan on 2022/04/14.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieName: UILabel!      // 영화이름
    @IBOutlet weak var movieAudiCnt: UILabel!   //관람객 수
    @IBOutlet weak var movieAudiAcc: UILabel!   //누적관람객 수
    @IBOutlet weak var MovieRank: UILabel!      //순위
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
