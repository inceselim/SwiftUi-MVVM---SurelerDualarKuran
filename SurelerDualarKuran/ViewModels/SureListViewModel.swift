//
//  SureListViewModel.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import Foundation
import Combine

final class SureListViewModel: ObservableObject {
    @Published private(set) var sureler: [Sure] = []
    @Published private(set) var errorMessage: String?

    init() {
        loadSures()
    }

    func loadSures() {
        do {
            sureler = try BundleJSONLoader.load("surelerData.json", as: [Sure].self)
            errorMessage = nil
        } catch {
            sureler = []
            errorMessage = "Sureler yüklenemedi: \(error.localizedDescription)"
        }
    }
}
