//
//  CircleCheckableCell.swift
//  CheckableTag
//
//  Created by airy on 2020/03/15.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

public class CircleCheckableCell: UICollectionViewCell, CheckableCellProtocol {
    
    public var animationProtocol: TouchCellAnimationProtocol!
    public var cellStyle: CellStyle = .normal
    
    public let textLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.gray
        view.textAlignment = .center
        view.backgroundColor = .clear
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 20)
        return view
    }()
    let marginView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        animationProtocol = self
        
        self.contentMode = .left
        self.backgroundColor = .clear
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        contentView.addSubview(textLabel)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.height / 2
        setCell()
        contentView.layer.cornerRadius = contentView.bounds.height / 2
    }
    
}

///animationのまとめ
extension CircleCheckableCell: TouchCellAnimationProtocol {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animationProtocol.touchStartAnimation(cell: self)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animationProtocol.touchEndAnimation(cell: self)
        
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animationProtocol.touchEndAnimation(cell: self)
    }
}
