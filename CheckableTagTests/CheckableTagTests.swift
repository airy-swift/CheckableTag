//
//  CheckableTagTests.swift
//  CheckableTagTests
//
//  Created by airy on 2020/03/14.
//  Copyright © 2020 airy. All rights reserved.
//

@testable import CheckableTag
import XCTest

class CheckableTagTests: XCTestCase, CheckableTagDataSource {
    
    let items = ["one", "two", "three"]
    
    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSetItems() {
        
        let testVC = TestVC()
        testVC.items = items
        XCTAssertEqual(testVC.items.count, items.count)
        guard testVC.checktag.dataSource != nil else { XCTAssert(false) ; return }
        XCTAssertEqual(testVC.checktag.items.count, items.count)
        
    }

    func testGetItems() {
        
        let checktag = CheckableTag()
        checktag.dataSource = self
        XCTAssertEqual(checktag.items.count, items.count)
        guard checktag.dataSource != nil else { XCTAssert(false); return }
        
    }

    func getItems(sender: CheckableTag) -> [String] {
        return items
    }
    
}

class TestVC: UIViewController {
    let checktag: CheckableTag = {
        let view = CheckableTag()
        view.cellType = .square
        view.cellStyle = .groove
        view.fontSize = 18
        view.canSelect = false
        view.tag = 10
        return view
    }()
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        checktag.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 300)
        
        checktag.dataSource = self
        
        self.view.addSubview(checktag)

    }
    
}
extension TestVC: CheckableTagDataSource {
    func getItems(sender: CheckableTag) -> [String] {
        return items
    }
}
