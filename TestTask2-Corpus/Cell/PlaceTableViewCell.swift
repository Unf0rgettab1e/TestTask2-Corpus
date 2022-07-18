//
//  PlaceTableViewCell.swift
//  TestTask2-Corpus
//
//  Created by Tony on 18.07.22.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var logoPlaceImageView: UIImageView!
    @IBOutlet weak var namePlaceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
