//
//  WWDCBannerStyle.swift
//  plSwiftShowcase
//
//  Created by Karolina Samorek on 15/05/2022.
//

import CoreGraphics
import DesignSystem
import DesignSystemUtils
import Foundation

enum WWDCBannerStyle {
    static let container = DSStyles.Shadows.banner
        .toViewAttributes(cornerRadius: DSTokens.CornerRadiuses.l)
    static let bannerRatio = SizeVariants<CGFloat>(compact: 230.0 / 348.0, regular: 200.0 / 500.0)
    static let backgroundImage = DSStyles.Shadows.banner
        .toViewAttributes(cornerRadius: DSTokens.CornerRadiuses.l)
        .toImageAttributes(image: .init(
            compact: DSImage(named: "background.compact"),
            regular: DSImage(named: "background.regular")
        ))
    static let header = DSStyles.Texts.header2onColor
    static let body = DSStyles.Texts.bodyOnColor
    static let button = DSStyles.Buttons.primaryCTA
}
