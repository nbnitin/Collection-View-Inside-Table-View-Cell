//
//  TableViewController.swift
//  CollectionViewInsideTableViewCell
//
//  Created by Umesh Chauhan on 22/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
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
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Section 1"
            break
        case 1:
            return "Section 2"
            break
        case 2:
            return "Section 3"
            break
            
        default:
            break
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.tableViewIndex = indexPath
       // cell.model = generateRandomData()
        return cell
    }
    

   
}



