//
//  TextsStyles.swift
//
//
//  Created by Karolina Samorek on 13/05/2022.
//

import DesignSystemUtils
import Foundation

public extension DSStyles.Texts {
    // MARK: - Headers
    static let header1 = DSTokens.Fonts.header1
        .toTextAttributes(color: DSTokens.Colors.textPrimary)

    static let header1onColor = DSTokens.Fonts.header1
        .toTextAttributes(color: DSTokens.Colors.textOnColor)

    static let header2 = DSTokens.Fonts.header2
        .toTextAttributes(color: DSTokens.Colors.textPrimary)

    static let header2onColor = DSTokens.Fonts.header2
        .toTextAttributes(color: DSTokens.Colors.textOnColor)

    // MARK: - Body
    static let body = DSTokens.Fonts.body
        .toTextAttributes(color: DSTokens.Colors.textPrimary)

    static let bodyOnColor = DSTokens.Fonts.body
        .toTextAttributes(color: DSTokens.Colors.textOnColor)

    // MARK: - Buttons
    static let buttonFilled = DSTokens.Fonts.button
        .toTextAttributes(color: DSTokens.Colors.backgroundPrimary)

    static let buttonStroked = DSTokens.Fonts.button
        .toTextAttributes(color: DSTokens.Colors.textPrimary)

    static let buttonCTA = DSTokens.Fonts.button
        .toTextAttributes(color: DSTokens.Colors.textOnColor)
}

#if DEBUG

import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
struct TextStylesPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Device.basic) { device in
                device.makeView(
                    VStack(spacing: DSTokens.Spaces.m) {
                        TextStylePreviewView(styleName: "Header/1", style: DSStyles.Texts.header1)
                        TextStylePreviewView(styleName: "Header/1/OnColor", style: DSStyles.Texts.header1onColor)
                        TextStylePreviewView(styleName: "Header/2", style: DSStyles.Texts.header2)
                        TextStylePreviewView(styleName: "Header/2/OnColor", style: DSStyles.Texts.header2onColor)
                            .background(Color.secondary)
                        TextStylePreviewView(styleName: "Body", style: DSStyles.Texts.body)
                        TextStylePreviewView(styleName: "Body/OnColor", style: DSStyles.Texts.bodyOnColor)
                            .background(Color.secondary)
                        TextStylePreviewView(styleName: "Button/Filled", style: DSStyles.Texts.buttonFilled)
                            .background(Color.secondary)
                        TextStylePreviewView(styleName: "Button/Stroked", style: DSStyles.Texts.buttonStroked)
                            .background(Color.secondary)
                        TextStylePreviewView(styleName: "Button/CTA", style: DSStyles.Texts.buttonCTA)
                            .background(Color.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(dsColor: DSTokens.Colors.backgroundPrimary))
                    .wrapInColorSchemes()
                )
            }
        }
    }
}

private struct TextStylePreviewView: View {
    @EnvironmentObject var layout: Layout

    let styleName: String
    let style: SizeVariants<TextAttributes>

    var body: some View {
        Text(styleName).apply(textAttributes: style.for(screen: layout.screen))
    }
}

#endif
