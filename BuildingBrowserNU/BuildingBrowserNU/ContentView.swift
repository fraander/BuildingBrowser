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
    
    @State var currentLoc: Location? = nil
    
    var tintColor: Color {
        if let cl = currentLoc {
            return cl.category.color()
        } else {
            return Color.nuRed
        }
    }
    
    @StateObject var searchable = Searching()
    
    @FocusState var focus: Searching.Focus?
    
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView(.vertical) {
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(focus == .searchBar ? .nuRed : .secondary)
                            TextField("Search", text: $searchable.searchText)
                                .focused($focus, equals: .searchBar)
                                .autocorrectionDisabled(true)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(focus == .searchBar ? Color.nuRed : Color.secondary, lineWidth: 1)
                        }
                        .overlay {
                            if (!searchable.searchText.isEmpty){
                                Button {
                                    searchable.searchText.removeAll()
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                }
                                .buttonStyle(.plain)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 16)
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.bottom, 18)
                        
                        CarouselView(currentLoc: $currentLoc)
                        
                        Divider()
                        
                        
                        ListView(currentLoc: $currentLoc)
                    }
                    .environmentObject(searchable)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.visible)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button {
                            focus = nil
                        } label: {
                            Label("Dismiss", systemImage: "keyboard.chevron.compact.down")
                                .labelStyle(.titleAndIcon)
                        }
                        .tint(Color.nuRed)
                    }
                }
            }
            .overlay {
                VStack {
                    WordmarkView()
                    Spacer()
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
