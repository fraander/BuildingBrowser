//
//  ColorfulButton.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/29/22.
//

import SwiftUI

struct ColorfulButton<Content: View>: View {
    let action: () -> Void
    let label: () -> Content
    let tint: Color
    
    var body: some View {
        Button(action: action, label: label)
            .buttonStyle(.bordered)
            .tint(tint)
            .font(.nuBody)
    }
}

struct ColorfulButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorfulButton(action: {}, label: {Text("Hello")}, tint: .pink)
    }
}
