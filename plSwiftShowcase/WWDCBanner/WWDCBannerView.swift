//
//  WWDCBannerView.swift
//  plSwiftShowcase
//
//  Created by Karolina Samorek on 13/04/2022.
//

import Combine
import DesignSystem
import DesignSystemUtils
import SwiftUI

struct WWDCBannerView: View {
    @EnvironmentObject var layout: Layout

    var body: some View {
        Image(
            SizeVariants(
                compact: "background.compact",
                regular: "background.regular"
            ).for(screen: layout.screen)
        )
        .resizable()
        .apply(viewAttributes: WWDCBannerStyle.container.for(screen: layout.screen))
        .aspectRatio(contentMode: .fit)
        .overlay(foreground)
        .frame(maxWidth: 500)
        .padding(DSTokens.Spaces.l)
    }

    @ViewBuilder private var foreground: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: DSTokens.Spaces.s) {
                Text("WWDC22")
                .apply(textAttributes: WWDCBannerStyle.header.for(screen: layout.screen))
                Text("Community Event")
                .apply(textAttributes: WWDCBannerStyle.body.for(screen: layout.screen))
                Spacer()
                Button("Join Now") { }
                .buttonStyle(DSButtonStyle(attributes: WWDCBannerStyle.button.for(screen: layout.screen)))
            }
            .padding(DSTokens.Spaces.l)
        }
    }
}

#if DEBUG

struct WWDCBannerViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Device.basic) { device in
                device.makeView(WWDCBannerView())
            }
            .background(Color(dsColor: DSTokens.Colors.backgroundPrimary))
            .preferredColorScheme(.dark)
        }
    }
}

#endif
