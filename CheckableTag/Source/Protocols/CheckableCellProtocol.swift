//
//  CheckableCellProtocol.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

public protocol CheckableCellProtocol: UICollectionViewCell {
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
    ///labelに表示するテキストをセットする
    func setTextToTextLabel(textName: String)
    ///選択時の色設定
    func selectedColor(color cellColor: CellColor?)
    ///非選択時の色設定
    func unSelectedColor(color cellColor: CellColor?)
    
    ///cellを設定
    func setCell()
    ///normalstyleの設定。cellにぴったりくっつく
    func setNormalStyle()
    ///groovestyleの設定。cellとの間に少し溝を作る
    func setGrooveStyle()
}

///共通してるものはもう作っておく
extension CheckableCellProtocol {
    
    public var margin: CGFloat {
        return LayoutConstants.margin
    }
    
    public func setTextToTextLabel(textName: String) {
        textLabel.text = textName
    }
    
    public func selectedColor(color cellColor: CellColor?) {
        textLabel.textColor = cellColor?.textColor ?? .white
        contentView.backgroundColor = cellColor?.backgroundColor ?? .init(red: 255 / 255, green: 100 / 255, blue: 100 / 255, alpha: 1)
    }
    
    public func unSelectedColor(color cellColor: CellColor?) {
        textLabel.textColor = cellColor?.textColor ?? .gray
        contentView.backgroundColor = cellColor?.backgroundColor ?? .init(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)
    }
    
    public func setCell() {
        switch cellStyle {
        case .normal:
            setNormalStyle()
        case .groove:
            setGrooveStyle()
        }
    }
    public func setNormalStyle() {
        textLabel.frame = contentView.bounds
    }
    public func setGrooveStyle() {
        contentView.frame = CGRect(x: self.bounds.minX + margin, y: self.bounds.minY + margin, width: self.bounds.width - margin * 2, height: self.bounds.height - margin * 2)
        textLabel.frame = contentView.bounds
    }
    
}
