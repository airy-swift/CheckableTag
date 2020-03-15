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
    var selectedColor: CellColor?
    var unSelectedColor: CellColor?
    
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
    private let checkableTagView: UICollectionView = {
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
            items = dataSource.getItems()
        }
    }
    
    /// checkabkeTagViewのdelegateなどを設定
    private func setCheckableTagView() {
        self.addSubview(checkableTagView)
        checkableTagView.dataSource = self
        checkableTagView.delegate = self
    }
    
    ///cellの色の設定を行う。
    public func setCellColors(selectedText: UIColor?, selectedBack: UIColor?, unSelectedText: UIColor?, unSelectedBack: UIColor?) {
        self.selectedColor = CellColor(textColor: selectedText, backgroundColor: selectedBack)
        self.unSelectedColor = CellColor(textColor: unSelectedText, backgroundColor: unSelectedBack)
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
}
