//
//  NormalCheckableCell.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

public class NormalCheckableCell: UICollectionViewCell, CheckableCellProtocol, TouchCellAnimationProtocol {
    
    public var animationProtocol: TouchCellAnimationProtocol!
    
    let textLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor.gray
        view.textAlignment = .center
        view.backgroundColor = .clear
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 20)
        return view
    }()
    let marginView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        animationProtocol = self
        self.contentMode = .topLeft
        setConstraints()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        marginView.layer.cornerRadius = innerMargin
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = innerMargin
        contentView.layer.borderWidth = 1
        
        contentView.addSubview(marginView)
        marginView.addSubview(textLabel)
        
        contentView.topAnchor.constraint(equalTo: marginView.topAnchor, constant: -outerMargin).isActive = true
        contentView.leadingAnchor.constraint(equalTo: marginView.leadingAnchor, constant: -outerMargin).isActive = true
        contentView.trailingAnchor.constraint(equalTo: marginView.trailingAnchor, constant: outerMargin).isActive = true
        contentView.bottomAnchor.constraint(equalTo: marginView.bottomAnchor, constant: outerMargin).isActive = true
        
        marginView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        marginView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        marginView.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        marginView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width - 20).isActive = true
        //        marginView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        marginView.topAnchor.constraint(equalTo: textLabel.topAnchor).isActive = true
        marginView.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor).isActive = true
        
        textLabel.topAnchor.constraint(equalTo: marginView.topAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: marginView.leadingAnchor, constant: innerMargin).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: marginView.trailingAnchor, constant: -innerMargin).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: marginView.bottomAnchor).isActive = true
        
    }
    
    func setTextToTextLabel(textName: String) {
        textLabel.text = textName
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animationProtocol.touchStartAnimation()
        
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animationProtocol.touchEndAnimation()
        
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animationProtocol.touchEndAnimation()
    }
    
}
