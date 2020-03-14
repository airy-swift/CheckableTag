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
        
        //選択されているか否かで色を変更。
        ischeckditems[indexPath.row] ? cell.selectedColor(color: .brown) : cell.unSelectedColor(color: .brown)
        
        //animationがしてされているならばアニメーションの情報を伝える。
        if let animation = animation {
            cell.animationProtocol = animation
        }
        
        //cellに表示するテキストを伝える。
        cell.setTextToTextLabel(textName: items[indexPath.row])
        return cell
    }
    
}
