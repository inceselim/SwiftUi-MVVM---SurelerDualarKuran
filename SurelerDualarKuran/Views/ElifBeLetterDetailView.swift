//
//  ElifBeLetterDetailView.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import SwiftUI

struct ElifBeLetterDetailView: View {
    let letter: ElifBeLetter

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(spacing: 12) {
                    Text(letter.arabic)
                        .font(.system(size: 112, weight: .bold))
                        .minimumScaleFactor(0.6)
                        .frame(maxWidth: .infinity)

                    Text(letter.name)
                        .font(.largeTitle.bold())

                    Text("\(letter.order). harf")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(.teal)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)

                DetailTextSection(title: "Telaffuz", systemImage: "speaker.wave.2", text: letter.pronunciation)

                VStack(alignment: .leading, spacing: 10) {
                    Label("Örnek", systemImage: "textformat.abc")
                        .font(.headline)
                        .foregroundStyle(.teal)

                    HStack(spacing: 16) {
                        Text(letter.example)
                            .font(.system(size: 58, weight: .bold))
                            .frame(width: 96, height: 82)
                            .background(.teal.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Okunuş")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)

                            Text(letter.exampleReading)
                                .font(.title2.bold())
                        }

                        Spacer(minLength: 0)
                    }
                }
                .padding(14)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                DetailTextSection(title: "Not", systemImage: "lightbulb", text: letter.note)
            }
            .padding()
        }
        .navigationTitle(letter.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ElifBeLetterDetailView(
        letter: ElifBeLetter(
            id: "be",
            order: 2,
            arabic: "ب",
            name: "Be",
            pronunciation: "Dudaklar kapatılıp açılarak b sesi verilir.",
            example: "بَ",
            exampleReading: "be",
            note: "Altında tek nokta bulunur."
        )
    )
}
