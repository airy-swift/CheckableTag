//
//  ExtensionCollectionDelegate.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

extension CheckableTag: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ischeckditems[indexPath.row] = !ischeckditems[indexPath.row]
        collectionView.reloadItems(at: [indexPath])
    }
}
