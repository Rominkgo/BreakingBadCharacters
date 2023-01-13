//
//  Model.swift
//  Rick&Morty
//
//  Created by Default on 1/13/23.
//

import Foundation

struct APIData: Decodable {
    let data: [BBCharacter]
}

struct BBCharacter: Identifiable, Decodable {
    let char_id: Int
    let name: String
    let nickname: String
    let img: String
    let portrayed: String
}

