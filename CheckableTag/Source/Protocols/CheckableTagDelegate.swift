//
//  CheckableTagDelegate.swift
//  CheckableTag
//
//  Created by airy on 2020/03/15.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

public protocol CheckableTagDelegate: class, TouchCellAnimationProtocol {
    func didSelected(cell: CheckableCellProtocol)
}

extension CheckableTagDelegate {
    func didSelected(cell: CheckableCellProtocol) {}
}
