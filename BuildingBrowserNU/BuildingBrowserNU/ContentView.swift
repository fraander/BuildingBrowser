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
                    ScrollView(.horizontal) {
                        HStack(spacing: 18) {
                            ForEach(Examples.locations) { loc in
                                NavigationLink {
                                    DetailView(currentLoc: $currentLoc, location: loc)
                                } label: {
                                    VStack {
                                        loc.photo
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipShape(RoundedRectangle(cornerRadius: 12.0))
                                            .shadow(radius: 2)
                                        
                                        HStack {
                                            loc.category.symbol()
                                                .foregroundColor(loc.category.color())
                                            Text(loc.name)
                                                .font(.system(.body, design: .rounded, weight: .regular))
                                        }
                                    }
                                }
                                .buttonStyle(.plain)
                                .padding(.bottom, 12)
                            }
                        }
                        .padding(.horizontal, 18)
                    }
                    .frame(height: 240)
                    .padding(.top, -36)
                    .padding(.bottom, 12)
                    
                    Divider()
                    
                    
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
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image(systemName: "pawprint.fill")
                            Text("Husky Places")
                                .font(.system(.title2, design: .rounded, weight: .semibold))
                        }
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

struct DetailView: View {
    @Binding var currentLoc: Location?
    @State var showFullScreenDescription = false
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                location.photo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 360)
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    .shadow(radius: 4)
                
                HStack {
                    Text(location.name)
                        .foregroundColor(location.category.color())
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    
                    Spacer()
                    
                    Label {
                        Text(location.abbreviation)
                    } icon: {
                        location.category.symbol()
                    }
                    .foregroundColor(.white)
                    .font(.system(.headline, design: .monospaced, weight: .regular))
                    .padding(12)
                    .background {
                        Capsule()
                            .fill(location.category.color())
                    }
                }
                
                GroupBox {
                    Text(Examples.lorem)
                        .font(.system(.body, design: .rounded, weight: .regular))
                        .lineLimit(12)
                        .padding()
                    
                    Button  {
                        showFullScreenDescription = true
                    } label: {
                        Text("Read more ...")
                    }
                    .buttonStyle(.bordered)
                    .tint(location.category.color())
                }
                
                Spacer()
            }
            .padding()
            .padding(.top, 90)
        }
        .ignoresSafeArea(.all)
        .task {
            currentLoc = location
        }
        .sheet(isPresented: $showFullScreenDescription) {
            ReadMoreView(location: location, currentLoc: $currentLoc)
        }
    }
}

struct ReadMoreView: View {
    @Environment(\.dismiss) var dismiss
    let location: Location
    @Binding var currentLoc: Location?
        
    var tintColor: Color {
        if let cl = currentLoc {
            return cl.category.color()
        } else {
            return Color.nuRed
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                Text(Examples.lorem)
                    .font(.system(.body, weight: .regular))
            }
            .padding()
            .navigationTitle(location.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
        .accentColor(tintColor)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var chosen = Examples.locations.randomElement()!
    
    static var previews: some View {
        NavigationStack {
            DetailView(currentLoc: .constant(chosen), location: chosen)
        }
    }
}

