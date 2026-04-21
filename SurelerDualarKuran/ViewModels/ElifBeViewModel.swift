//
//  ElifBeViewModel.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import Foundation
import Combine

final class ElifBeViewModel: ObservableObject {
    @Published private(set) var letters: [ElifBeLetter] = []
    @Published private(set) var marks: [ElifBeMark] = []
    @Published private(set) var errorMessage: String?

    init() {
        loadElifBe()
    }

    func loadElifBe() {
        do {
            let data = try BundleJSONLoader.load("elifBeData.json", as: ElifBeData.self)
            letters = data.letters.sorted { $0.order < $1.order }
            marks = data.marks
            errorMessage = nil
        } catch {
            letters = []
            marks = []
            errorMessage = "Elif Be verileri yüklenemedi: \(error.localizedDescription)"
        }
    }
}
