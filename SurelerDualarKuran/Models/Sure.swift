//
//  Sure.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import Foundation

struct Sure: Decodable, Hashable, Identifiable {
    let title: String
    let c1: String
    let d1: String
    let d2: String
    let link1: String

    var id: String { title }
}
