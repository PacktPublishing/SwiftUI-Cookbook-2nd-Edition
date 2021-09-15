//
//  ActivityIndicator.swift
//  UIKitToSwiftUI
//
//  Created by Edgar Nzokwe on 9/15/21.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
     var animating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if animating {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
