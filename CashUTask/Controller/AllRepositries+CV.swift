//
//  AllRepositries+CV.swift
//  CashUTask
//
//  Created by Sherif  Wagih on 6/20/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
extension AllRepositriesVC
{
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(Cell: RepoCell.self, indexPath: indexPath)
        let currentRepo = results[indexPath.row]
        cell.setCellData(repo:currentRepo)
        paginateData(item: indexPath.item)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = results[indexPath.row].description?.height(withConstrainedWidth: view.frame.width - 20, font: .boldSystemFont(ofSize: 18)) ?? 0
        return CGSize(width: view.frame.width, height: 130 + height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    internal func setupNavigationController()
    {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "All Repos"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(white: 0.95, alpha: 1)
    }
    
    internal func setupCollectionView()
    {
        collectionView.registerCell(cell: RepoCell.self)
        collectionView.backgroundColor = .lightGray
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let height:CGFloat = isDoneLoadingData ? 0 : 100
        return CGSize(width: view.frame.width, height: height)
    }
}
