//
//  ViewPreview.swift
//  PreviewUIKitViews
//
//  Created by Edgar Nzokwe on 8/23/21.
//

import UIKit
import SwiftUI


struct ViewPreview: UIViewRepresentable {
    let viewBuilder: () -> UIView

    init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }

    func makeUIView(context: Context) -> some UIView {
          viewBuilder()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Nothing here
    }
}
