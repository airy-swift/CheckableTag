//
//  CheckableCellProtocol.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

protocol CheckableCellProtocol {
    ///contentViiewとmarginViewの間のマージン
    var outerMargin: CGFloat { get }
    ///marginViewとtextLabelの間のマージン
    var innerMargin: CGFloat { get }
    
    ///collectionviewに最初からあるview
    var contentView: UIView { get }
    ///選択したとき見栄えを良くするためにcontentviewの中に置かれるview。次のtextLabelをサブビューとして持つ。
    var marginView: UIView { get }
    ///textを表示するために一番中心に配置されるview
    var textLabel: UILabel { get }
    
    ///選択時の色設定
    func selectedColor(color: UIColor)
    ///非選択時の色設定
    func unSelectedColor(color: UIColor)
}

extension CheckableCellProtocol {
    var outerMargin: CGFloat {
        return LayoutConstants.outerMargin
    }
    
    var innerMargin: CGFloat {
        return LayoutConstants.innerMargin
    }
    
    public func selectedColor(color: UIColor) {
        marginView.backgroundColor = color
        textLabel.textColor = .white
        contentView.layer.borderColor = color.cgColor
    }
    
    public func unSelectedColor(color: UIColor) {
        marginView.backgroundColor = .white
        textLabel.textColor = .gray
        contentView.layer.borderColor = color.cgColor
    }
}
