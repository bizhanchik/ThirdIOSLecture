//
//  Character.swift
//  ThirdIOSLecture
//
//  Created by Bizhan on 04.06.2025.
//

import Foundation

struct Character: Identifiable, Decodable{
    let id: Int
    let name: String
    let species: String
    let gender: String
    let image : URL
    let location: Location
    let origin: Origin
}




extension Character {
    struct Location: Decodable {
        let name: String
    }
    
    struct Origin: Decodable {
        let name: String
    }
}
