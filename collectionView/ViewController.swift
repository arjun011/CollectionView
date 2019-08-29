//
//  ViewController.swift
//  collectionView
//
//  Created by Arjun Patel on 24/08/19.
//  Copyright © 2019 Arjun Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var tableViewCellCoordinator: [Int: IndexPath] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
}

// UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewTableViewCell") as! CollectionViewTableViewCell
        cell.selectionStyle = .none
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        
        let tag = tableViewCellCoordinator.count
        
        print("Tag=",tag)
        
        cell.collectionView.tag = tag
        tableViewCellCoordinator[tag] = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section: \(section)"
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! CollectionViewTableViewCell
        cell.collectionView.reloadData()
        cell.collectionView.contentOffset = .zero
    }
}

// UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        var text = ""
        if let indexPathOfCellInTableView = tableViewCellCoordinator[collectionView.tag] {
            text = "\(indexPathOfCellInTableView)"
        }
        cell.label.text = text + " \(indexPath)"
        return cell
    }
}

// UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("CollectionView index path",indexPath.row)
        print("CollectionView index path",indexPath.section)
        
        print("Collectionview tag =",collectionView.tag)
        
        print("selected collectionViewCell with indexPath: \(indexPath) in tableViewCell with indexPath: \(tableViewCellCoordinator[collectionView.tag]!)")
    }
}
