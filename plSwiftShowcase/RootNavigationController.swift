//
//  RootNavigationController.swift
//  plSwiftShowcase
//
//  Created by Karolina Samorek on 15/05/2022.
//

import UIKit
import DesignSystemUtils

final class RootNavigationController: UITabBarController {
    private var layout: Layout

    init(layout: Layout) {
        self.layout = layout
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        layout.screen = Screen(size: size)
        super.viewWillTransition(to: size, with: coordinator)
    }
}
