//
//  GridCollectionViewCell.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 14/04/23.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "GridCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with image: UIImage) {
        self.imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "GridCollectionViewCell", bundle: nil)
    }

}
