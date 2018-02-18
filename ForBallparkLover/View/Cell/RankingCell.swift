//
//  RankingCell.swift
//  ForBallparkLover
//
//  Created by Presto on 2018. 2. 12..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

class RankingCell: UITableViewCell {

    @IBOutlet weak var ranking: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var totalMatch: UILabel!
    @IBOutlet weak var winningMatch: UILabel!
    @IBOutlet weak var losingMatch: UILabel!
    @IBOutlet weak var drawMatch: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var distance: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
