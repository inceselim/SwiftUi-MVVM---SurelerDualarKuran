//
//  ElifBe.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import Foundation

struct ElifBeData: Decodable {
    let letters: [ElifBeLetter]
    let marks: [ElifBeMark]
}

struct ElifBeLetter: Decodable, Hashable, Identifiable {
    let id: String
    let order: Int
    let arabic: String
    let name: String
    let pronunciation: String
    let example: String
    let exampleReading: String
    let note: String
}

struct ElifBeMark: Decodable, Hashable, Identifiable {
    let id: String
    let arabic: String
    let name: String
    let reading: String
    let note: String
}
