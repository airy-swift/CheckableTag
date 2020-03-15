//
//  ExtensionConllectionDataSource.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

extension CheckableTag: UICollectionViewDataSource {
    
    ///tagの数の設定
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    ///cellの設定
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = getCellType(collection: collectionView, index: indexPath)
        
        //選択されているか否かで色を変更。
        switchCellColor(cell: cell, index: indexPath)
        
        //animationが指定されているならばアニメーションの情報を伝える。
        if let animation = animation {
            cell.animationProtocol = animation
        }
        
        //cellのテキストについて
        cell.setTextToTextLabel(textName: items[indexPath.row])
        cell.textLabel.font = UIFont.systemFont(ofSize: fontSize)
        cell.isUserInteractionEnabled = canSelect
        
        ///cellのスタイルを設定する。
        cell.cellStyle = cellStyle
        
        return cell
    }
    
}
