//
//  TownTableViewCell.swift
//  TestTask2-Corpus
//
//  Created by Tony on 15.07.22.
//

import UIKit

class TownTableViewCell: UITableViewCell {

    @IBOutlet weak var logoTownImageView: UIImageView!
    @IBOutlet weak var nameTownLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
