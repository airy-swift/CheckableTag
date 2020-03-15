//
//  ExtensionCollectionDelegate.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

extension CheckableTag: UICollectionViewDelegate {
    ///タップしたセルをリロードする。
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isSelectedItems[indexPath.row] = !isSelectedItems[indexPath.row]
        collectionView.reloadItems(at: [indexPath])
    }
    
}
