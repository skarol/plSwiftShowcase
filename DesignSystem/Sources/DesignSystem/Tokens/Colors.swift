//
//  Colors.swift
//  
//
//  Created by Karolina Samorek on 12/05/2022.
//

import Foundation
import CoreGraphics
import DesignSystemUtils

public extension DSTokens.Colors {
    // MARK: - Background

    /// Background/Primary color
    static let backgroundPrimary = DSColor(
        light: CGColor.from(hex: "#F5F5F5")!,
        dark: CGColor.from(hex: "#222222")!
    )
    /// Background/Secondary
    static let backgroundSecondary = DSColor(
        light: CGColor.from(hex: "#E9E9E9")!,
        dark: CGColor.from(hex: "#353535")!
    )

    // MARK: - Text

    /// Text/Primary
    static let textPrimary = DSColor(
        light: CGColor.from(hex: "#484848")!,
        dark: CGColor.from(hex: "#DDDDDD")!
    )
    /// Text/Secondary
    static let textSecondary = DSColor(
        light: CGColor.from(hex: "#848484")!,
        dark: CGColor.from(hex: "#9A9899")!
    )
    /// Text/OnColor color
    static let textOnColor = DSColor(CGColor.from(hex: "#FAFAFA")!)

    // MARK: - Accent

    /// Accent/Primary/Default
    static let accentPrimaryDefault = DSColor(CGColor.from(hex: "#AA49DB")!)
    /// Accent/Primary/Highlighted
    static let accentPrimaryHighlighted = DSColor(CGColor.from(hex: "#BE7FDD")!)
    /// Accent/Primary/Disabled
    static let accentPrimaryDisabled = DSColor(CGColor.from(hex: "#C6C6C6")!)
    /// Accent/Secondary/Default
    static let accentSecondaryDefault = DSColor(CGColor.from(hex: "#536DFE")!)
    /// Accent/Secondary/Highlighted
    static let accentSecondaryHighlighted = DSColor(CGColor.from(hex: "#7388FF")!)

    // MARK: - Separator

    /// Separator/Primary
    static let separatorPrimary = DSColor(CGColor.from(hex: "##DADADA")!)

    // MARK: - Gradient

    /// Gradient/Start
    static let gradientStart = DSColor(CGColor.from(hex: "##FF26B2")!)
    /// Gradient/End
    static let gradientEnd = DSColor(CGColor.from(hex: "##3F51B5")!)
}
