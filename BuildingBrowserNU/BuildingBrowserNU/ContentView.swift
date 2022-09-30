//
//  ContentView.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/19/22.
//

import SwiftUI



struct ContentView: View {
    
    @State var currentLoc: Location? = nil
    
    var tintColor: Color {
        if let cl = currentLoc {
            return cl.category.color()
        } else {
            return Color.nuRed
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    CarouselView(currentLoc: $currentLoc)
                    
                    Divider()
                    
                    
                    ListView(currentLoc: $currentLoc)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        WordmarkView()
                    }
                }
            }
            
        }
        .accentColor(tintColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
