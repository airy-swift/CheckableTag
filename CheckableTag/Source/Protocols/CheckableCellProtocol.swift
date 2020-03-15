//
//  CheckableCellProtocol.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

protocol CheckableCellProtocol: UICollectionViewCell {
    ///cellの細かな表示を変更する
    var cellStyle: CellStyle { get set }
    ///cellとcontentViiewの間のマージン
    var margin: CGFloat { get }
    
    ///collectionviewに最初からあるview
    var contentView: UIView { get }
    ///textを表示するために一番中心に配置されるview
    var textLabel: UILabel { get }
    
    ///アニメーションを行うためのプロトコル
    var animationProtocol: TouchCellAnimationProtocol! { get set }
    
    func setTextToTextLabel(textName: String)
    ///選択時の色設定
    func selectedColor(color: UIColor)
    ///非選択時の色設定
    func unSelectedColor(color: UIColor)
}

extension CheckableCellProtocol {
    
    var margin: CGFloat {
        return LayoutConstants.margin
    }
    
    func setTextToTextLabel(textName: String) {
        textLabel.text = textName
    }
    
    public func selectedColor(color: UIColor) {
        contentView.backgroundColor = color
        textLabel.textColor = .white
    }
    
    public func unSelectedColor(color: UIColor) {
        contentView.backgroundColor = color
        textLabel.textColor = .gray
    }
}
