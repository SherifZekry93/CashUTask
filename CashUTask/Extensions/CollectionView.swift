//
//  CollectionView.swift
//  CashUTask
//
//  Created by Sherif  Wagih on 6/20/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit

extension UICollectionView
{
    func registerCell<Cell:UICollectionViewCell>(cell:Cell.Type)
    {
        let cellName = String(describing: Cell.self)
        self.register(Cell.self, forCellWithReuseIdentifier: cellName)
    }
    func dequeue<Cell:UICollectionViewCell>(Cell:Cell.Type,indexPath:IndexPath) -> Cell
    {
        let cellName = String(describing: Cell.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? Cell else {
            fatalError("Something went wrong")
        }
        return cell
    }
}
