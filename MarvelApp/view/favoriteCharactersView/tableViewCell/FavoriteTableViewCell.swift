//
//  FavoriteTableViewCell.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 10.10.2021.
//

import UIKit
import SDWebImage

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCharacterCell(name: String,description: String, imageUrl: String){
        self.lblName.text = name
        self.lblDescription.text = description
        let transformer = SDImageResizingTransformer(size: CGSize(width: 60, height: 60), scaleMode: .fill)
        self.imgAvatar.sd_setImage(with: URL(string: imageUrl), placeholderImage: nil, context: [.imageTransformer: transformer])
    }
    
}
