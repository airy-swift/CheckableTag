//
//  NormalCheckableCell.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

public class NormalCheckableCell: UICollectionViewCell, CheckableCellProtocol {

        private(set) var outermargin: CGFloat = 3
        private(set) var innermargin: CGFloat = 5
        private let effectlayer = CAShapeLayer()
        
        private let textLabel: UILabel = {
            let view = UILabel()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.textColor = UIColor.gray
            view.textAlignment = .center
            view.backgroundColor = .clear
            view.numberOfLines = 0
            view.font = UIFont.systemFont(ofSize: 20)
            return view
        }()
        private let marginView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            self.contentMode = .topLeft
            setup()
        }

        public required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setup() {
            
            marginView.layer.cornerRadius = innermargin
            
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.backgroundColor = .white
            contentView.layer.borderColor = UIColor.gray.cgColor
            contentView.layer.cornerRadius = innermargin
            contentView.layer.borderWidth = 1
            
            contentView.addSubview(marginView)
            marginView.addSubview(textLabel)
            

            contentView.topAnchor.constraint(equalTo: marginView.topAnchor, constant: -outermargin).isActive = true
            contentView.leadingAnchor.constraint(equalTo: marginView.leadingAnchor, constant: -outermargin).isActive = true
            contentView.trailingAnchor.constraint(equalTo: marginView.trailingAnchor, constant: outermargin).isActive = true
            contentView.bottomAnchor.constraint(equalTo: marginView.bottomAnchor, constant: outermargin).isActive = true
                    
            marginView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            marginView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            marginView.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
            marginView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width - 20).isActive = true
    //        marginView.heightAnchor.constraint(equalToConstant: 25).isActive = true
            marginView.topAnchor.constraint(equalTo: textLabel.topAnchor).isActive = true
            marginView.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor).isActive = true

            textLabel.topAnchor.constraint(equalTo: marginView.topAnchor).isActive = true
            textLabel.leadingAnchor.constraint(equalTo: marginView.leadingAnchor, constant: innermargin).isActive = true
            textLabel.trailingAnchor.constraint(equalTo: marginView.trailingAnchor, constant: -innermargin).isActive = true
            textLabel.bottomAnchor.constraint(equalTo: marginView.bottomAnchor).isActive = true

        }

        func setupContents(textName: String) {
            textLabel.text = textName
        }
        
        public func changeToOnColor(maincolor: UIColor) {
            
            marginView.backgroundColor = maincolor
            textLabel.textColor = .white
            contentView.layer.borderColor = maincolor.cgColor
        }
        
        public func changeToOffColor(maincolor: UIColor) {
            
            marginView.backgroundColor = .white
            textLabel.textColor = .gray
            contentView.layer.borderColor = maincolor.cgColor
        }
        
        open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            touchStartAnimation()
        }
    
        open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesEnded(touches, with: event)
            touchEndAnimation()
        }
    
        open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesCancelled(touches, with: event)
            touchEndAnimation()
        }
    
        private func touchStartAnimation() {
            UIView.animate(withDuration: 0.0,
                delay: 0.0,
                options: UIView.AnimationOptions.curveEaseIn,
                animations: {() -> Void in
                    self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95);
                    self.alpha = 0.7
                },
                completion: nil
            )
        }
        private func touchEndAnimation() {
            UIView.animate(withDuration: 0.0,
                delay: 0.0,
                options: UIView.AnimationOptions.curveEaseIn,
                animations: {() -> Void in
                    self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
                    self.alpha = 1
                },
                completion: nil
            )
        }
        
}
