//
//  ExtensionFlowLayoutDelegate.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

extension CheckableTag: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }

    // セルのサイズ
    public func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.text = self.items[indexPath.row]
        label.sizeToFit()
        let size = label.frame.size
        
        switch cellType {
        case .square, .curve, .round:
            return CGSize(width: size.width + 30, height: size.height + 10)
        case .circle:
            return CGSize(width: size.width + 30, height: size.width + 30)
        }
        
    }
}
