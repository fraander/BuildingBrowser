//
//  WordmarkView.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/29/22.
//

import SwiftUI

struct WordmarkView: View {
    var body: some View {
        HStack {
            Image(systemName: "pawprint.fill")
                .foregroundColor(Color.nuRed)
            Text("Husky Places")
                .font(.system(.title2, design: .rounded, weight: .semibold))
        }
    }
}

struct WordmarkView_Previews: PreviewProvider {
    static var previews: some View {
        WordmarkView()
    }
}
