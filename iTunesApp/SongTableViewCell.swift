//
//  SongTableViewCell.swift
//  iTunesApp
//
//  Created by doriswlc on 2022/9/16.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
