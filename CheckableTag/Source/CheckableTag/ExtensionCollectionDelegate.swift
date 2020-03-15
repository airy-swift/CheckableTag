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
        ///TODO: dequeでcellを取得すると一回前にタップしたものが取得される。要改善。
        let cell = collectionView.cellForItem(at: indexPath) as! CheckableCellProtocol
        
        ///選択情報と色の変更
        isSelectedItems[indexPath.row] = !isSelectedItems[indexPath.row]
        isSelectedItems[indexPath.row] ? cell.selectedColor(color: selectedColor) : cell.unSelectedColor(color: unSelectedColor)
        
        ///選択処理を実行
        if let delegate = delegate {
            delegate.didSelected(cell: cell)
        }
    }
    
}
