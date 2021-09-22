//
//  SnapshotTestingSwiftUITests.swift
//  SnapshotTestingSwiftUITests
//
//  Created by Giordano Scalzo on 16/09/2021.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SnapshotTestingSwiftUI

extension Snapshotting where Value:View, Format == UIImage {
    public static func image(
    on config: ViewImageConfig) -> Snapshotting {
        Snapshotting<UIViewController, UIImage>.image(on: config).pullback(UIHostingController.init(rootView:))
    }
}

class SnapshotTestingSwiftUITests: XCTestCase {
    override class func setUp() {
        diffTool = "ksdiff"
    }

    func testContentView() throws {
        assertSnapshot(matching: ContentView(),
                       as: .image(on: .iPhoneXsMax))
    }
}
