//
//  ShadowsStyles.swift
//
//
//  Created by Karolina Samorek on 15/05/2022.
//

import CoreGraphics
import DesignSystemUtils
import Foundation

public extension DSStyles.Shadows {
    static let banner =
        SizeVariants<ShadowAttributes>(regular: ShadowAttributes(
            color: DSTokens.Colors.shadowPrimary,
            radius: 4,
            opacity: 1,
            offset: CGSize(width: 0, height: 4)
        ))
}
