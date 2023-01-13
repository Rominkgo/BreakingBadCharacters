//
//  Model.swift
//  Rick&Morty
//
//  Created by Default on 1/13/23.
//

import Foundation

struct APIData: Decodable {
    let results: [Planet]
    
}

struct Planet: Decodable, Identifiable {
    let name: String
    let terrain: String
    var id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case name
        case terrain
    }

}


