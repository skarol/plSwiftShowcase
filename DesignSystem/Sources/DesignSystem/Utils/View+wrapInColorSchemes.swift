//
//  View+wrapInColorSchemes.swift
//  
//
//  Created by Karolina Samorek on 25/05/2022.
//

import SwiftUI

public extension View {
    /// Wraps content into color scheme.
    /// - Parameters:
    ///   - colorSchemes: Color schemes to use. If not provided, uses both ``.light`` and ``.dark``.
    /// - Returns: Content view wrapped in color schemes.
    @available(macOS 11.0, *)
    @ViewBuilder func wrapInColorSchemes(colorSchemes: [ColorScheme] = [.light, .dark]) -> some View {
        wrapInColorSchemes(with: DSTokens.Colors.textPrimary)
    }
}
