//
//  ViewControllerPreview.swift
//  PreviewUIKitViews
//
//  Created by Edgar Nzokwe on 8/23/21.
//

import UIKit
import SwiftUI


struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController

    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Stays empty because we're not dealing with state changes
    }
}
