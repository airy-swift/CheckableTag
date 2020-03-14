//
//  CheckableTag.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

open class CheckableTag: UIView {
    
    private(set) var items: [String] = []
    public lazy var ischeckditems: [Bool] = {
        return [Bool].init(repeating: false, count: items.count)
    }()
    
    public var dataSource: CheckableTagDataSource?
    
    private let checkableTagView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 7
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(NormalCheckableCell.self, forCellWithReuseIdentifier: "Cell")
        view.contentMode = .left
        view.backgroundColor = .clear
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
        
        if let dataSource = dataSource {
            items = dataSource.getItems()
        }
    }
    
    /// settting about checkabkeTagView
    private func setCheckableTagView() {
        self.addSubview(checkableTagView)
        checkableTagView.dataSource = self
        checkableTagView.delegate = self
    }
    
}
