//
//  ExtensionConllectionDataSource.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

extension CheckableTag: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NormalCheckableCell
        if ischeckditems[indexPath.row] {
            cell.changeToOnColor(maincolor: .brown)
        } else {
            cell.changeToOffColor(maincolor: .brown)
        }
        let cellText = items[indexPath.item]
        cell.setupContents(textName: cellText)
        cell.setupContents(textName: items[indexPath.row])
        return cell
    }
    
}
