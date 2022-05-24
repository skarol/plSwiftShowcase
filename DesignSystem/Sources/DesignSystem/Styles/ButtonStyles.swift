//
//  ButtonStyles.swift
//
//
//  Created by Karolina Samorek on 13/05/2022.
//

import CoreGraphics
import DesignSystemUtils
import Foundation

public extension DSStyles.Buttons {
    static let primaryFilled: SizeVariants<ButtonAttributes> = makeDSButtonStyle(
        textStyle: DSStyles.Texts.buttonFilled,
        backgroundColorForState: [
            .normal: DSTokens.Colors.textPrimary,
            .highlighted: DSTokens.Colors.textSecondary,
            .disabled: DSTokens.Colors.accentPrimaryDisabled
        ]
    )

    static let primaryStroked: SizeVariants<ButtonAttributes> = makeDSButtonStyle(
        textStyle: DSStyles.Texts.buttonStroked,
        borderColorForState: [
            .normal: DSTokens.Colors.textPrimary,
            .highlighted: DSTokens.Colors.textSecondary,
            .disabled: DSTokens.Colors.accentPrimaryDisabled
        ]
    )

    static let primaryCTA: SizeVariants<ButtonAttributes> = makeDSButtonStyle(
        textStyle: DSStyles.Texts.buttonCTA,
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
        let viewAttributesForState = backgroundColorForState.keys
            .reduce(into: [:]) { partialResult, state in
                partialResult[state] = ViewAttributes(
                    backgroundColor: backgroundColorForState[state],
                    cornerRadius: DSTokens.CornerRadiuses.m
                )
            }

        return makeDSButtonStyle(
            textStyle: textStyle,
            viewAttributesForState: viewAttributesForState
        )
    }

    private static func makeDSButtonStyle(
        textStyle: SizeVariants<TextAttributes>,
        borderColorForState: [ControlState: DSColor]
    ) -> SizeVariants<ButtonAttributes> {
        let viewAttributesForState = borderColorForState.keys
            .reduce(into: [:]) { partialResult, state in
                partialResult[state] = ViewAttributes(
                    borderAttributes: .init(width: 2, color: borderColorForState[state]),
                    cornerRadius: DSTokens.CornerRadiuses.m
                )
            }

        return makeDSButtonStyle(
            textStyle: textStyle,
            viewAttributesForState: viewAttributesForState
        )
    }

    private static func makeDSButtonStyle(
        textStyle: SizeVariants<TextAttributes>,
        viewAttributesForState: [ControlState: ViewAttributes]
    ) -> SizeVariants<ButtonAttributes> {
        textStyle.toButtonStateAttributes()
            .toStates(viewAttributes: viewAttributesForState)
            .toButtonAttributes()
            .with(contentInsets: .init(
                small: [.horizontal: DSTokens.Spaces.l, .vertical: DSTokens.Spaces.s],
                compact: [.horizontal: DSTokens.Spaces.xl, .vertical: DSTokens.Spaces.m],
                regular: [.horizontal: DSTokens.Spaces.xxl, .vertical: DSTokens.Spaces.m]
            ))
    }
}

#if DEBUG

import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
struct ButtonStylesPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Device.basic) { device in
                device.makeView(
                    VStack {
                        ButtonStylePreviewView(styleName: "Primary/Filled", style: DSStyles.Buttons.primaryFilled)
                        ButtonStylePreviewView(styleName: "Primary/Stroked", style: DSStyles.Buttons.primaryStroked)
                        ButtonStylePreviewView(styleName: "Primary/CTA", style: DSStyles.Buttons.primaryCTA)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(dsColor: DSTokens.Colors.backgroundPrimary))
                    .wrapInColorSchemes()
                )
            }
        }
    }
}

private struct ButtonStylePreviewView: View {
    @EnvironmentObject var layout: Layout

    let styleName: String
    let style: SizeVariants<ButtonAttributes>

    var body: some View {
        VStack {
            Button("Button") {}
                .buttonStyle(DSButtonStyle(attributes: style.for(screen: layout.screen)))
            Text(styleName)
                .apply(textAttributes: DSStyles.Texts.body.for(screen: layout.screen))
        }
    }
}

extension View {
    @ViewBuilder func wrapInColorSchemes(colorSchemes: [ColorScheme] = [.light, .dark]) -> some View {
        Group {
            ForEach(colorSchemes) { scheme in
                HStack {
                    Text(String(describing: scheme))
                        .foregroundColor(Color(dsColor: DSTokens.Colors.textPrimary))
                        .rotationEffect(.degrees(-90))
                    self
                }
                .preferredColorScheme(scheme)
            }
        }
    }
}

extension ColorScheme: Identifiable {
    public var id: Int {
        self.hashValue
    }
}

#endif
