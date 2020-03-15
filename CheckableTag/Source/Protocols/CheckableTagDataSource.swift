//
//  CheckableTagDataSource.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

public protocol CheckableTagDataSource: class {
    func getItems(sender: CheckableTag) -> [String]
    func getSelected(sender: CheckableTag) -> [Bool]?
}

extension CheckableTagDataSource {
    func getSelected(sender: CheckableTag) -> [Bool]? { return nil }
}
