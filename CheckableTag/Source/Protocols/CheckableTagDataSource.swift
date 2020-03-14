//
//  CheckableTagDataSource.swift
//  CheckableTag
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import UIKit

public protocol CheckableTagDataSource: class {
    func getItems() -> [String]
}

extension CheckableTagDataSource {
    func getItems() -> [String] {
        return ["hello", "you", "should", "get", "this", "delegate."]
    }
}
