//
//  Method2TableViewCell.swift
//  CollectionViewInsideTableViewCell
//
//  Created by Umesh Chauhan on 22/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class Method2TableViewCell: UITableViewCell {

    @IBOutlet weak var collView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var collectionViewOffset: CGFloat {
        get {
            return collView.contentOffset.x
        }
        
        set {
            collView.contentOffset.x = newValue
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //The D type conforms to both the datasource and delegate protocols. Cool. And we set the collection view’s tag property
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        collView.delegate = dataSourceDelegate
        collView.dataSource = dataSourceDelegate
        collView.tag = row
        collView.reloadData()
    }

}
