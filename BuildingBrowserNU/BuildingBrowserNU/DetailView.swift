//
//  DetailView.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/29/22.
//

import SwiftUI

struct DetailView: View {
    @Binding var currentLoc: Location?
    @State var showFullScreenDescription = false
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                location.photo
                    .bannerImage()
                
                HStack {
                    Text(location.name)
                        .foregroundColor(location.category.color())
                        .font(.nuTitle)
                    
                    Spacer()
                    
                    MonospacePill(
                        text: location.abbreviation,
                        image: location.category.symbol(),
                        color: location.category.color()
                    )
                }
                
                GroupBox {
                    Text(Examples.lorem)
                        .font(.nuBody)
                        .lineLimit(12)
                        .padding()
                    
                    ColorfulButton(action: {
                        showFullScreenDescription = true
                    }, label: {
                        Text("Read more ...")
                    }, tint: location.category.color())
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
            ReadMoreView(location: location)
        }
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
