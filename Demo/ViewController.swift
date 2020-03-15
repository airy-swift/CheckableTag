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
        view.cellType = .square
        view.cellStyle = .groove
        view.fontSize = 18
        view.canSelect = false
        view.tag = 10
        return view
    }()
    
    let secondtag: CheckableTag = {
        let view = CheckableTag()
        view.cellType = .square
        view.cellStyle = .groove
        view.fontSize = 18
        view.canSelect = false
        view.tag = 20
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        checktag.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 300)
        secondtag.frame = CGRect(x: 0, y: 400, width: UIScreen.main.bounds.width, height: 300)
        
        checktag.dataSource = self
        checktag.delegate = self
        checktag.animation = self
        
        secondtag.dataSource = self
        secondtag.delegate = self
        secondtag.animation = self
        
        self.view.addSubview(checktag)
        self.view.addSubview(secondtag)
        
    }

}

extension ViewController: CheckableTagDataSource {
    func getItems(sender: CheckableTag) -> [String] {
        let arr = ["#Hello", "#How", "#What", "#Where", "#When", "#Who", "#Why", "#Goodbye", "#Good", "#Great", "#Fantastic", "im a fantastic baby"]
        return arr
    }
    func getSelected(sender: CheckableTag) -> [Bool]? {
        switch sender.tag {
        case 10:
            return [false, false, true, false, true, true, false, false, false, false, false, true]
        case 20:
            return [false, true, true, false, true, false, false, true, false, false, false, true]
        default:
            return [false, false, false, false, false, false, false, false, false, false, false, false]
        }
    }
}

extension ViewController: CheckableTagDelegate {
    func didSelected(cell: CheckableCellProtocol) {
        
    }

}
