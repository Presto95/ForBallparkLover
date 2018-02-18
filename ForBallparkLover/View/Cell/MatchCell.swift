//
//  MatchTableViewCell.swift
//  ForBallparkLover
//
//  Created by Presto on 2018. 2. 12..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

class MatchCell: UITableViewCell {

    @IBOutlet weak var matchArea: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var awayTeamFavorite: UIImageView!
    @IBOutlet weak var homeTeamFavorite: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
