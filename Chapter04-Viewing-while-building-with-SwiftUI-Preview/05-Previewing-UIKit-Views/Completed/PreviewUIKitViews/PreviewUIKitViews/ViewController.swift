//
//  ViewController.swift
//  PreviewUIKitViews
//
//  Created by Edgar Nzokwe on 8/22/21.
//

import UIKit
import SwiftUI



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Previewing UIKit Views"
        label.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(label)
    }


}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController()
        }
    }
}
