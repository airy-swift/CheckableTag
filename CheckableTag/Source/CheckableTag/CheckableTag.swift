//
//  CheckableTag.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

open class CheckableTag: UIView {
    
    ///cellの形を決定するやつら
    public var cellType: CellType = .square
    public var cellStyle: CellStyle = .normal
    
    ///cellの色を決定するやつら
    var textColor: CellColor = CellColor()
    var backColor: CellColor = CellColor()
    var lineColor: CellColor = CellColor()
    
    ///cellに表示するテキストや選択状態の管理など
    private(set) var items: [String] = []
    public lazy var isSelectedItems: [Bool] = {
        return [Bool].init(repeating: false, count: items.count)
    }()
    public var fontSize: CGFloat = 20
    ///cellを選択して色変更を行えるかどうか
    public var canSelect: Bool = true
    
    ///cellに関したデータを引っ張ってくるヨ
    public weak var dataSource: CheckableTagDataSource?
    public weak var delegate: CheckableTagDelegate?
    public weak var animation: TouchCellAnimationProtocol?
    
    ///タグの実際の本体
    public let checkableTagView: UICollectionView = {
        ///cellのレイアウト設定
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 7
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        ///collectionviewの設定
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(SquareCheckableCell.self, forCellWithReuseIdentifier: CellType.square.rawValue)
        view.register(CurveCheckableCell.self, forCellWithReuseIdentifier: CellType.curve.rawValue)
        view.register(RoundCheckableCell.self, forCellWithReuseIdentifier: CellType.round.rawValue)
        view.register(CircleCheckableCell.self, forCellWithReuseIdentifier: CellType.circle.rawValue)
        view.backgroundColor = .clear
        view.contentMode = .left
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setCheckableTagView()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
        setCheckableTagView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        //tagを表示できる範囲を全体にする
        checkableTagView.frame = self.bounds
        
        ///tagが設定されていればそれを取得
        if let dataSource = dataSource {
            items = dataSource.getItems(sender: self)
            if let selected = dataSource.getSelected(sender: self) {
                guard items.count == selected.count else { fatalError("items count and selected count must be same") }
                isSelectedItems = selected
            }
        }
    }
    
    /// checkabkeTagViewのdelegateなどを設定
    private func setCheckableTagView() {
        self.addSubview(checkableTagView)
        checkableTagView.dataSource = self
        checkableTagView.delegate = self
    }
    
    
    /// 選択状態の色を指定する
    /// - Parameters:
    ///   - text: テキストカラー
    ///   - back: バックグラウンドカラー
    ///   - line: 枠線カラー
    public func setSelectedColor(text: UIColor?, back: UIColor?, line: UIColor?) {
        self.textColor.selectedColor = text
        self.backColor.selectedColor = back
        self.lineColor.selectedColor = line
    }
    
    /// 非選択状態の色を指定する
    /// - Parameters:
    ///   - text: テキストカラー
    ///   - back: バックグラウンドカラー
    ///   - line: 枠線カラー
    public func setUnSelectedColor(text: UIColor?, back: UIColor?, line: UIColor?) {
        self.textColor.unSelectedColor = text
        self.backColor.unSelectedColor = back
        self.lineColor.unSelectedColor = line
    }
    ///cellの種類を特定する
    public func getCellType(collection: UICollectionView, index: IndexPath) -> CheckableCellProtocol {
        switch cellType {
        case .square:
            return collection.dequeueReusableCell(withReuseIdentifier: cellType.rawValue, for: index) as! SquareCheckableCell
        case .curve:
            return collection.dequeueReusableCell(withReuseIdentifier: cellType.rawValue, for: index) as! CurveCheckableCell
        case .round:
            return collection.dequeueReusableCell(withReuseIdentifier: cellType.rawValue, for: index) as! RoundCheckableCell
        case .circle:
            return collection.dequeueReusableCell(withReuseIdentifier: cellType.rawValue, for: index) as! CircleCheckableCell
        }
    }
    
    ///順番通りで選択されているか否かを返す。
    public func getIsSelected() -> [Bool] {
        return isSelectedItems
    }
    
    public func switchCellColor(cell: CheckableCellProtocol, index: IndexPath) {
        if isSelectedItems[index.row] {
            cell.selectedColor(text: textColor, back: backColor, line: lineColor)
        } else {
            cell.unSelectedColor(text: textColor, back: backColor, line: lineColor)
        }
    }
}
