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
    public var selectedColor: UIColor = .cyan//.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
    public var unSelectedColor: UIColor = .red//.init(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    
    ///cellに表示するテキストや選択状態を管理
    private(set) var items: [String] = []
    public lazy var isSelectedItems: [Bool] = {
        return [Bool].init(repeating: false, count: items.count)
    }()
    
    ///cellに関したデータを引っ張ってくるヨ
    public var dataSource: CheckableTagDataSource?
    public var animation: TouchCellAnimationProtocol?
    
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
}
