//
//  SceneDelegate.swift
//  plSwiftShowcase
//
//  Created by Karolina Samorek on 13/04/2022.
//

import DesignSystem
import DesignSystemUtils
import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var layout = Layout(screen: Screen(size: .zero))

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            layout.screen = Screen(size: window.coordinateSpace.bounds.size)
            let rootViewController = RootNavigationController(layout: layout)

            let uiKitTabBarItem = UITabBarItem(title: "UIKit", image: UIImage(systemName: "sun.max.fill"), selectedImage: nil)
            let uiKitViewController = WWDCBannerViewController(layout: layout)
            uiKitViewController.tabBarItem = uiKitTabBarItem
            uiKitViewController.view.backgroundColor = UIColor(dsColor: DSTokens.Colors.backgroundPrimary)

            let swiftUiTabBarItem = UITabBarItem(title: "SwiftUI", image: UIImage(systemName: "moon.fill"), selectedImage: nil)
            let swiftUiViewController = UIHostingController(rootView: WWDCBannerView().environmentObject(layout))
            swiftUiViewController.tabBarItem = swiftUiTabBarItem
            swiftUiViewController.view.backgroundColor = UIColor(dsColor: DSTokens.Colors.backgroundPrimary)

            rootViewController.viewControllers = [
                swiftUiViewController,
                uiKitViewController
            ]

            window.rootViewController = rootViewController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
