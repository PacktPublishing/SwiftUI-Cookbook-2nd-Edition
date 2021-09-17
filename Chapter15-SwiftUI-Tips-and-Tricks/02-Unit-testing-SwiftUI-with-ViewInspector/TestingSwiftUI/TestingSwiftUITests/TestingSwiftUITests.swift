//
//  TestingSwiftUITests.swift
//  TestingSwiftUITests
//
//  Created by Giordano Scalzo on 15/09/2021.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import TestingSwiftUI

extension ContentView: Inspectable { }

class TestingSwiftUIAppTests: XCTestCase {
    func testStartWithUSASelected() throws {
        let view = ContentView()

        try view.inspect().vStack().text(0)
        try view.inspect().vStack().hStack(1)
        try view.inspect().vStack().spacer(2)
        try view.inspect().vStack().text(3)

        let buttons = try view.inspect().vStack().hStack(1).forEach(0)
        XCTAssertEqual(try buttons.button(0).labelView().text().string(), "USA")
        XCTAssertEqual(try buttons.button(1).labelView().text().string(), "France")
        XCTAssertEqual(try buttons.button(2).labelView().text().string(), "Germany")
        XCTAssertEqual(try buttons.button(3).labelView().text().string(), "Italy")

        let country = try view.inspect().vStack().text(3)
        XCTAssertEqual(try country.string(), "USA")
    }
    
    func testSelectItaly() throws {
        var view = ContentView()

        let exp = view.on(\.didAppear) { view in
            XCTAssertEqual(try view.actualView().originCountry, 0)
            try view.actualView().inspect().vStack().hStack(1)
                        .forEach(0).button(3).tap()
            XCTAssertEqual(try view.actualView().originCountry, 3)
        }

        ViewHosting.host(view: view)
        wait(for: [exp], timeout: 0.1)
    }
}
