//
//  TableViewCell.swift
//  CollectionViewInsideTableViewCell
//
//  Created by Umesh Chauhan on 22/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collView: UICollectionView!
    let model: [[UIColor]] = generateRandomData()
    var tableViewIndex : IndexPath!

    
    var collectionViewOffset: CGFloat {
        get {
            return collView.contentOffset.x
        }
        
        set {
            collView.contentOffset.x = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   

}

extension TableViewCell : UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.model.count)
        return self.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = model[tableViewIndex.section][indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Table View Index Path\(self.tableViewIndex)----------collection view index path\(indexPath)" )
    }
    
}

