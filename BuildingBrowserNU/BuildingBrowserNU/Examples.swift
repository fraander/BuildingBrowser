//
//  Examples.swift
//  BuildingBrowserNU
//
//  Created by Frank Anderson on 9/19/22.
//

import Foundation
import SwiftUI

// adds 3 new colors
extension Color {
    static let nuRed = Color(red: 201/256, green: 49/256, blue: 52/256)
    static let nuBlue = Color(red: 46/256, green: 107/256, blue: 177/256)
    static let nuMint = Color(red: 93/256, green: 184/256, blue: 171/256)
}

// represents a Location on campus with a unique ID, name, abbreviation, and category
struct Location: Identifiable {
    // a category is one of: academic, residential, social
    enum LocationCategory: Comparable {
        case academic, residential, social
        
        func symbol() -> Image {
            switch self {
                case .social:
                    return Image(systemName: "person.2.fill")
                case .residential:
                    return Image(systemName: "building.fill")
                case .academic:
                    return Image(systemName: "graduationcap.fill")
            }
        }
        
        func color() -> Color {
            switch self {
                case .social:
                    return Color.nuMint
                case .residential:
                    return Color.nuBlue
                case .academic:
                    return Color.nuRed
            }
        }
    }
    
    var id = UUID()
    let name: String
    let abbreviation: String
    let category: LocationCategory
    
    // computed property: `photo` to get a photo displaying the location
    var photo: Image {
        return Image(abbreviation.lowercased())
    }
}

// examples of different buildings on campus; would want to pull data from an API eventually
struct Examples {
    static let sw = Location(name: "Stetson West", abbreviation: "SW", category: .residential)
    static let sp = Location(name: "Speare Hall", abbreviation: "SP", category: .residential)
    static let se = Location(name: "Stetson East", abbreviation: "SE", category: .residential)
    static let iv = Location(name: "International Village", abbreviation: "IV", category: .residential)
    static let ri = Location(name: "Richards Hall", abbreviation: "RI", category: .academic)
    static let el = Location(name: "Ell Hall", abbreviation: "EL", category: .academic)
    static let dg = Location(name: "Dodge Hall", abbreviation: "DG", category: .academic)
    static let wvh = Location(name: "West Village H", abbreviation: "WV-H", category: .academic)
    static let mc = Location(name: "Marino Center", abbreviation: "MC", category: .social)
    static let cc = Location(name: "Centennial Common", abbreviation: "CC", category: .social)
    static let km = Location(name: "Krentzman Quad", abbreviation: "KQ", category: .social)
    // static let wh = Location(name: "White Hall", abbreviation: "WH", category: .residential)
    // static let sn = Location(name: "Snell Engineering", abbreviation: "SN", category: .academic)
    
    // list of all locations, sorted by category
    static let locations = [sw, sp, se, iv, ri, el, dg, wvh, mc, cc, km].sorted(by: {$0.category < $1.category})
    
    static let lorem = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tellus integer feugiat scelerisque varius morbi. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Aenean et tortor at risus viverra adipiscing at in tellus. Vitae turpis massa sed elementum tempus egestas sed sed risus. Vulputate sapien nec sagittis aliquam malesuada bibendum arcu vitae elementum. Eget sit amet tellus cras adipiscing enim. Nisl suscipit adipiscing bibendum est ultricies integer quis. Id neque aliquam vestibulum morbi blandit cursus. Euismod lacinia at quis risus. Commodo viverra maecenas accumsan lacus. Vitae justo eget magna fermentum iaculis. Molestie at elementum eu facilisis sed odio morbi quis commodo. Quis viverra nibh cras pulvinar mattis. Nec ultrices dui sapien eget mi proin sed libero. Urna cursus eget nunc scelerisque viverra mauris.

Venenatis cras sed felis eget velit aliquet sagittis id. Et pharetra pharetra massa massa ultricies mi quis. Amet nisl purus in mollis nunc sed id semper. Ut sem nulla pharetra diam sit. Imperdiet nulla malesuada pellentesque elit eget gravida cum. Sit amet est placerat in egestas erat imperdiet sed euismod. Sit amet mauris commodo quis imperdiet. Sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt. Consectetur adipiscing elit pellentesque habitant morbi tristique senectus et netus. Et odio pellentesque diam volutpat commodo sed. Orci sagittis eu volutpat odio facilisis.

Gravida in fermentum et sollicitudin ac orci phasellus egestas. Nibh tortor id aliquet lectus proin nibh nisl. Pharetra sit amet aliquam id diam. Proin libero nunc consequat interdum varius sit amet. Nullam non nisi est sit. Suscipit adipiscing bibendum est ultricies integer quis auctor. Velit scelerisque in dictum non consectetur a. Morbi tristique senectus et netus et malesuada. Orci porta non pulvinar neque. Ante in nibh mauris cursus mattis molestie a.

Ultrices eros in cursus turpis massa. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper. Turpis egestas maecenas pharetra convallis posuere morbi leo. Proin libero nunc consequat interdum varius sit amet mattis vulputate. Congue nisi vitae suscipit tellus mauris a. Erat velit scelerisque in dictum non. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Porttitor rhoncus dolor purus non enim praesent elementum facilisis. Sagittis id consectetur purus ut faucibus. Eget velit aliquet sagittis id consectetur purus. Praesent semper feugiat nibh sed pulvinar proin. Posuere morbi leo urna molestie at elementum eu. Nec dui nunc mattis enim ut. Ut placerat orci nulla pellentesque dignissim. Duis at tellus at urna condimentum mattis pellentesque. Blandit cursus risus at ultrices mi tempus imperdiet.

Integer enim neque volutpat ac tincidunt vitae semper quis lectus. Felis bibendum ut tristique et egestas quis ipsum. Ipsum dolor sit amet consectetur adipiscing elit ut aliquam. Tincidunt arcu non sodales neque sodales ut etiam. Venenatis lectus magna fringilla urna porttitor rhoncus. Scelerisque mauris pellentesque pulvinar pellentesque. Et tortor consequat id porta nibh venenatis cras sed felis. Fusce id velit ut tortor pretium viverra suspendisse potenti. Turpis egestas sed tempus urna et. Blandit turpis cursus in hac habitasse platea. Nunc vel risus commodo viverra maecenas accumsan lacus vel. Nulla facilisi cras fermentum odio eu. Amet dictum sit amet justo donec enim diam vulputate ut. Magnis dis parturient montes nascetur ridiculus mus. Purus in mollis nunc sed. Eget mauris pharetra et ultrices. Pulvinar etiam non quam lacus suspendisse faucibus interdum. Mi quis hendrerit dolor magna eget. Tincidunt arcu non sodales neque sodales.
"""
}
