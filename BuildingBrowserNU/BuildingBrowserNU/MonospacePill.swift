//
//  MonospacePill.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/29/22.
//

import SwiftUI

struct MonospacePill: View {
    let text: String
    let image: Image
    let color: Color
    
    var body: some View {
        Label {
            Text(text)
        } icon: {
            image
        }
        .foregroundColor(.white)
        .font(.system(.headline, design: .monospaced, weight: .regular))
        .padding(12)
        .background {
            Capsule()
                .fill(color)
        }
    }
}

struct MonospacePill_Previews: PreviewProvider {
    static var previews: some View {
        MonospacePill(text: Examples.iv.abbreviation, image: Examples.iv.category.symbol(), color: Examples.iv.category.color())
    }
}
