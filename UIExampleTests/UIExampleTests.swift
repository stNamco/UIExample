//
//  UIExampleTests.swift
//  UIExampleTests
//
//  Created by stnamco on 2020/05/12.
//  Copyright © 2020 namco. All rights reserved.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import UIExample

class UIExampleTests: XCTestCase {
    private var contentView: ContentView!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    func testViewDidLoad_renderViews() throws {
        contentView = ContentView()
        let vc = UIHostingController(rootView: contentView)
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.25))
        assertSnapshot(matching: vc, as: .image)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
