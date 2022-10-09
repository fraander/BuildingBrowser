//
//  Searchbar.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 10/9/22.
//

import SwiftUI

struct Searchbar: View {
    
    
    @EnvironmentObject var searchable: Searching
    @FocusState var focus: Searching.Focus?
    
    var body: some View {
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
}

struct Searchbar_Previews: PreviewProvider {
    static var previews: some View {
        Searchbar()
    }
}
