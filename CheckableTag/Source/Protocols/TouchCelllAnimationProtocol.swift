//
//  TouchCelllAnimationProtocol.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import Foundation
import UIKit

public protocol TouchCellAnimationProtocol: class {
    func touchStartAnimation(cell: CheckableCellProtocol)
    func touchEndAnimation(cell: CheckableCellProtocol)
}

extension TouchCellAnimationProtocol {
    public func touchStartAnimation(cell: CheckableCellProtocol) {}
    public func touchEndAnimation(cell: CheckableCellProtocol) {}
}
