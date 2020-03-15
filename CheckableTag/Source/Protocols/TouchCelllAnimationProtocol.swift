//
//  TouchCelllAnimationProtocol.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

public protocol TouchCellAnimationProtocol: UICollectionViewCell {
    func touchStartAnimation()
    func touchEndAnimation()
}

extension TouchCellAnimationProtocol {
    public func touchStartAnimation() {
        UIView.animate(withDuration: 0.0, delay: 0.0,
                       options: [],
            animations: {() -> Void in
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                self.alpha = 0.7
            },
            completion: nil
        )
    }
    public func touchEndAnimation() {
        UIView.animate(withDuration: 0.0, delay: 0.0,
            options: [],
            animations: {() -> Void in
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.alpha = 1
            },
            completion: nil
        )
    }
}
