//
//  CellColor.swift
//  CheckableTag
//
//  Created by airy on 2020/03/15.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

public struct CellColor {
    var selectedColor: UIColor?
    var unSelectedColor: UIColor?
    
    init() {}
    
    init(selectedColor: UIColor?, unSelectedColor: UIColor?) {
        self.selectedColor = selectedColor
        self.unSelectedColor = unSelectedColor
    }
}
