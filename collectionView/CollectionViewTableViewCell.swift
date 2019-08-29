//
//  CollectionViewTableViewCell.swift
//  collectionView
//
//  Created by Arjun Patel on 24/08/19.
//  Copyright © 2019 Arjun Patel. All rights reserved.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
