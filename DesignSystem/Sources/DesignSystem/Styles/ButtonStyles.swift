//
//  ButtonStyles.swift
//  
//
//  Created by Karolina Samorek on 13/05/2022.
//

import Foundation
import CoreGraphics
import DesignSystemUtils

public extension DSStyles.Buttons {
    /// Call to Action Primary Button
    static let ctaPrimary: SizeVariants<ButtonAttributes> = makeDSButtonStyle(
        textStyle: DSStyles.Texts.buttonFilled,
        backgroundColorForState: [
            .normal: DSTokens.Colors.accentPrimaryDefault,
            .highlighted: DSTokens.Colors.accentPrimaryHighlighted,
            .disabled: DSTokens.Colors.accentPrimaryDisabled
        ]
    )

    private static func makeDSButtonStyle(
        textStyle: SizeVariants<TextAttributes>,
        backgroundColorForState: [ControlState: DSColor]
    ) -> SizeVariants<ButtonAttributes> {
        textStyle.toButtonStateAttributes()
            .with(cornerRadius: SizeVariants<CGFloat?>(
                compact: DSTokens.CornerRadiuses.m,
                regular: DSTokens.CornerRadiuses.l
            ))
            .toStates(backgroundColorForState: backgroundColorForState)
            .toButtonAttributes()
            .with(contentInsets: .init(
                small: [.horizontal: DSTokens.Spaces.s, .vertical: DSTokens.Spaces.xs],
                compact: [.horizontal: DSTokens.Spaces.m, .vertical: DSTokens.Spaces.s],
                regular: [.horizontal: DSTokens.Spaces.l, .vertical: DSTokens.Spaces.m]
            ))
    }
}
