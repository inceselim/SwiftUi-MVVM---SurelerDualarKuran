//
//  DuaListViewModel.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import Foundation
import Combine

final class DuaListViewModel: ObservableObject {
    @Published private(set) var dualar: [Dua] = []
    @Published private(set) var errorMessage: String?

    init() {
        loadDuas()
    }

    func loadDuas() {
        do {
            dualar = try BundleJSONLoader.load("dualarData.json", as: [Dua].self)
            errorMessage = nil
        } catch {
            dualar = []
            errorMessage = "Dualar yüklenemedi: \(error.localizedDescription)"
        }
    }
}

