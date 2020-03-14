//
//  ViewController.swift
//  Demo
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

import CheckableTag
import UIKit

class ViewController: UIViewController {
    
    let checktag: CheckableTag = {
        let view = CheckableTag()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        checktag.frame = self.view.bounds
        checktag.dataSource = self
        self.view.addSubview(checktag)
        
    }

}

extension ViewController: CheckableTagDataSource {
    func getItems() -> [String] {
        let arr = ["hey", "hey", "hey", "hey", "hey", "hey"]
        return arr
    }
}
