//
//  CharacterTableViewCell.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var imgFavorite: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if let disclosureButton = allSubviews.compactMap({ $0 as? UIButton }).last {
            let image = disclosureButton.backgroundImage(for: .normal)?.withRenderingMode(.alwaysTemplate)
            disclosureButton.setBackgroundImage(image, for: .normal)
        }
    }
    
    func setCharacterCell(name: String, imageUrl: String, isFavorite : Bool = false){
        let color = UIColor.random
        self.tintColor = color
        self.lblName.text = name
        self.lblName.textColor = color
        let transformer = SDImageResizingTransformer(size: CGSize(width: 80, height: 80), scaleMode: .fill)
        self.imgAvatar.sd_setImage(with: URL(string: imageUrl), placeholderImage: nil, context: [.imageTransformer: transformer])
        self.imgAvatar.layer.borderWidth = 1.0
        self.imgAvatar.layer.borderColor = color.cgColor
        self.imgFavorite.isHighlighted = isFavorite
    }
    
}
