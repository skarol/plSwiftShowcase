//
//  TextsStyles.swift
//  
//
//  Created by Karolina Samorek on 13/05/2022.
//

import Foundation
import DesignSystemUtils

public extension DSStyles.Texts {
    static let bannerHeader = DSTokens.Fonts.bannerHeader
        .toTextAttributes(color: DSTokens.Colors.textOnColor)

    /// Text Style used on filled buttons
    static let buttonFilled = DSTokens.Fonts.button
        .toTextAttributes(color: DSTokens.Colors.textOnColor)
}
