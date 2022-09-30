//
//  ListView.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/29/22.
//

import SwiftUI

struct ListView: View {
    @Binding var currentLoc: Location?
    
    var body: some View {
        ScrollView {
            ForEach(Examples.locations) { loc in
                NavigationLink {
                    DetailView(currentLoc: $currentLoc, location: loc)
                } label: {
                    VStack {
                        ZStack {
                            
                            Color(uiColor: UIColor.tertiarySystemBackground)
                            
                            HStack {
                                loc.category.symbol()
                                    .foregroundColor(loc.category.color())
                                Text(loc.name)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(.caption, design: .rounded, weight: .regular))
                                    .foregroundColor(.secondary)
                            }
                            .font(.system(.body, design: .rounded, weight: .regular))
                            .padding(.horizontal)
                            
                        }
                        
                        Divider()
                    }
                    .frame(maxWidth: .infinity, idealHeight: 40)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView(currentLoc: .constant(Examples.iv))
        }
    }
}
