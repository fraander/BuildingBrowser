//
//  BannerImage+Image.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/29/22.
//

import SwiftUI

extension Image {
    func bannerImage() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: 360)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .shadow(radius: 4)
    }
}
