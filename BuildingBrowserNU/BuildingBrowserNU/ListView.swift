//
//  ListView.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/29/22.
//

import SwiftUI

struct ListView: View {
    @Environment(\.colorScheme) var colorMode
    @EnvironmentObject var searchable: Searching
    @Binding var currentLoc: Location?
    
    var locations: [Location] {
        return searchable.searchText.isEmpty ? Examples.locations : Examples.locations.filter {
            $0.name.lowercased().contains(searchable.searchText.lowercased())
        }
    }
    
    var body: some View {
        ScrollView {
            ForEach(locations) { loc in
                NavigationLink {
                    DetailView(currentLoc: $currentLoc, location: loc)
                } label: {
                    VStack {
                        ZStack {
                            Color(uiColor: colorMode == .dark ? UIColor.systemBackground :  UIColor.tertiarySystemBackground)
                            
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
                .environmentObject(Searching())
        }
    }
}
