//
//  Fonts.swift
//  
//
//  Created by Karolina Samorek on 12/05/2022.
//

import Foundation
import DesignSystemUtils

extension DSTokens.Fonts {
    static let header1 = SizeVariants<DSFont>(
        small: headers.withSize(32),
        regular: headers.withSize(48)
    )
    static let header2 = SizeVariants<DSFont>(
        small: headers.withSize(24),
        regular: headers.withSize(32)
    )
    static let body = SizeVariants<DSFont>(regular: primary)
    static let button = SizeVariants<DSFont>(compact: buttons.withSize(16), regular: buttons)

    private static let headers = DSFont.systemFont(ofSize: 22, weight: .bold)
    private static let buttons = DSFont.systemFont(ofSize: 17, weight: .medium)
    private static let primary = DSFont.systemFont(ofSize: 16, weight: .regular)
    private static let secondary = DSFont.systemFont(ofSize: 16, weight: .light)
}
