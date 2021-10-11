//
//  ComicCollectionViewCell.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 9.10.2021.
//

import UIKit
import SDWebImage

class ComicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblYear: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setComicCell(title: String, imageUrl: String){
        self.lblYear.text = title
        let transformer = SDImageResizingTransformer(size: CGSize(width: 90, height: 160), scaleMode: .fill)
        self.imgAvatar.sd_setImage(with: URL(string: imageUrl), placeholderImage: nil, context: [.imageTransformer: transformer])
    }
    
    override func prepareForReuse() {
        self.lblYear.text = nil
        self.imgAvatar.image = nil
        self.imgAvatar.sd_cancelCurrentImageLoad()
    }
}


