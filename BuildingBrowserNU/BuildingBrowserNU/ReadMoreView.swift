//
//  ReadMoreView.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/29/22.
//

import SwiftUI

struct ReadMoreView: View {
    @Environment(\.dismiss) var dismiss
    let location: Location
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                Divider()
                
                ScrollView {
                    
                    Text(Examples.lorem)
                        .font(.nuBody)
                        .padding(.vertical, 12)
                }
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(location.name)
                        .font(.nuHeadline)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .font(.nuBody)
                }
            }
        }
        .accentColor(location.category.color())
    }
}





struct ReadMoreView_Previews: PreviewProvider {
    static var previews: some View {
        ReadMoreView(location: Examples.iv)
    }
}
