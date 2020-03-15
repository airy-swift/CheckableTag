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
        isSelectedItems[indexPath.row] ? cell.selectedColor(color: selectedColor) : cell.unSelectedColor(color: unSelectedColor)
        
        //animationが指定されているならばアニメーションの情報を伝える。
        if let animation = animation {
            cell.animationProtocol = animation
        }
        
        //cellに表示するテキストを伝える。
        cell.setTextToTextLabel(textName: items[indexPath.row])
        
        ///cellのスタイルを設定する。
        cell.cellStyle = cellStyle
        
        return cell
    }
    
    ///cellの種類を特定する
    private func getCellType(collection: UICollectionView, index: IndexPath) -> CheckableCellProtocol {
        switch cellType {
        case .square:
            return collection.dequeueReusableCell(withReuseIdentifier: cellType.rawValue, for: index) as! SquareCheckableCell
        case .curve:
            return collection.dequeueReusableCell(withReuseIdentifier: cellType.rawValue, for: index) as! CurveCheckableCell
        case .round:
            return collection.dequeueReusableCell(withReuseIdentifier: cellType.rawValue, for: index) as! RoundCheckableCell
        }
    }
    
}
