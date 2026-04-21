//
//  BundleJSONLoader.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import Foundation

enum BundleJSONLoaderError: LocalizedError {
    case fileNotFound(String)

    var errorDescription: String? {
        switch self {
        case .fileNotFound(let fileName):
            return "\(fileName) dosyası bundle içinde bulunamadı."
        }
    }
}

enum BundleJSONLoader {
    static func load<T: Decodable>(_ fileName: String, as type: T.Type = T.self) throws -> T {
        let parts = fileName.split(separator: ".", maxSplits: 1).map(String.init)
        let resourceName = parts.first ?? fileName
        let resourceExtension = parts.count > 1 ? parts[1] : "json"

        guard let url = Bundle.main.url(forResource: resourceName, withExtension: resourceExtension) else {
            throw BundleJSONLoaderError.fileNotFound(fileName)
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
