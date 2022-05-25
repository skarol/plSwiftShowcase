//
//  WWDCBannerViewController.swift
//  plSwiftShowcase
//
//  Created by Karolina Samorek on 13/04/2022.
//

import Combine
import DesignSystem
import DesignSystemUtils
import UIKit

final class WWDCBannerViewController: UIViewController {
    var layout: Layout

    @LayoutView(attributes: WWDCBannerStyle.container)
    private var bannerContainer = DSView()

    @LayoutView(attributes: WWDCBannerStyle.backgroundImage)
    private var backgroundImageView = UIImageView()

    @LayoutView(attributes: WWDCBannerStyle.header)
    private var headerLabel = UILabel()

    @LayoutView(attributes: WWDCBannerStyle.body)
    private var bodyLabel = UILabel()

    @LayoutView(attributes: WWDCBannerStyle.button)
    private var button = UIButton(type: .custom)

    private var constrains: [LayoutConstraint<NSLayoutConstraint, CGFloat>] = []

    private var cancellables: Set<AnyCancellable> = []

    init(layout: Layout) {
        self.layout = layout
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    private func setupLayout() {
        $bannerContainer.startObserving(layout: layout)
        $backgroundImageView.startObserving(layout: layout)
        $headerLabel.startObserving(layout: layout)
        $bodyLabel.startObserving(layout: layout)
        $button.startObserving(layout: layout)

        view.addSubview(bannerContainer)
        bannerContainer.addSubview(backgroundImageView)
        bannerContainer.addSubview(headerLabel)
        bannerContainer.addSubview(bodyLabel)
        bannerContainer.addSubview(button)

        backgroundImageView.clipsToBounds = true
        backgroundImageView.contentMode = .scaleAspectFit
        
        headerLabel.text = "WWDC22"
        bodyLabel.text = "Community Event"
        button.setTitle("Join Now", for: [])

        bannerContainer.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        bannerContainer.backgroundColor = .systemPink

        constrains = [
            LayoutConstraint(
                constraint: bannerContainer.heightAnchor.constraint(
                    equalTo: bannerContainer.widthAnchor,
                    multiplier: WWDCBannerStyle.bannerRatio.regular
                ),
                multiplier: WWDCBannerStyle.bannerRatio
            )
        ]

        constrains.activateAndObserve(layout: layout)

        NSLayoutConstraint.activate([
            bannerContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            bannerContainer.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            bannerContainer.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: DSTokens.Spaces.l),
            bannerContainer.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: DSTokens.Spaces.l),
            bannerContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 500),
        ])
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: bannerContainer.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: bannerContainer.leadingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bannerContainer.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: bannerContainer.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: bannerContainer.topAnchor, constant: DSTokens.Spaces.l),
            headerLabel.trailingAnchor.constraint(equalTo: bannerContainer.trailingAnchor, constant: -DSTokens.Spaces.l),
            bodyLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: DSTokens.Spaces.s),
            bodyLabel.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bannerContainer.bottomAnchor, constant: -DSTokens.Spaces.l),
            button.trailingAnchor.constraint(equalTo: bannerContainer.trailingAnchor, constant: -DSTokens.Spaces.l)
        ])
    }
}

#if DEBUG

import SwiftUI

struct ShowcaseViewControllerPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Device.basic) { device in
                device.makeView(WWDCBannerViewController(layout: device.layout).toPreview())
            }
        }
    }
}

#endif
