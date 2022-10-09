//
//  ContentView.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/19/22.
//

import SwiftUI

class Searching: ObservableObject {
    @Published var searchText = ""
    
    enum Focus {
        case searchBar, other
    }
}


struct ContentView: View {
    
    @StateObject var searchable = Searching()
    @State var currentLoc: Location? = nil
    
    var tintColor: Color {
        if let cl = currentLoc {
            return cl.category.color()
        } else {
            return Color.nuRed
        }
    }
    
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView(.vertical) {
                    VStack {
                        Searchbar()
                        
                        CarouselView(currentLoc: $currentLoc)
                        
                        Divider()
                        
                        
                        ListView(currentLoc: $currentLoc)
                    }
                    .environmentObject(searchable)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.visible)
            }
            .overlay {
                WordmarkView()
                    .pinToTop()
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
