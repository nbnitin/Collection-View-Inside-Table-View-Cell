//
//  Method2TableViewController.swift
//  CollectionViewInsideTableViewCell
//
//  Created by Nitin Bhatia on 22/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class Method2TableViewController: UITableViewController {
    
    let model: [[UIColor]] = generateRandomData()
    var storedOffsets = [Int: CGFloat]()


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? Method2TableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0


    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! CollectionViewCell
        let vc = segue.destination as! ViewController
        vc.x = cell.title
        vc.view.backgroundColor = model[cell.collectionTag][cell.cellNo]
    }

  
}

extension Method2TableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return model[collectionView.tag].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath as IndexPath) as! CollectionViewCell
        
        cell.backgroundColor = model[collectionView.tag][indexPath.item]
        cell.title = "title \(indexPath.row) and collection tag  is \(collectionView.tag)"
        cell.cellNo = indexPath.row
        cell.collectionTag = collectionView.tag
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(" \(collectionView.tag) ------ \(indexPath.row) " )
    }
    
}
