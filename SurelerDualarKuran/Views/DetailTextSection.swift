//
//  DetailTextSection.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import SwiftUI

struct DetailTextSection: View {
    let title: String
    let systemImage: String
    let text: String

    var body: some View {
        if !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                Label(title, systemImage: systemImage)
                    .font(.headline)
                    .foregroundStyle(.teal)

                Text(text)
                    .font(.body)
                    .lineSpacing(5)
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(14)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        }
    }
}

#Preview {
    DetailTextSection(
        title: "Okunuşu",
        systemImage: "text.quote",
        text: "Detay metni burada gösterilir."
    )
    .padding()
}
