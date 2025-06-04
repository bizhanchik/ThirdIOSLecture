//
//  Episode.swift
//  ThirdIOSLecture
//
//  Created by Bizhan on 04.06.2025.
//

import Foundation

struct Episode: Identifiable ,Decodable {
    let id: Int
    let name: String
    let airDate: String
}
