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
        
        checktag.frame = self.view.bounds
        self.view.addSubview(checktag)
    }

}
