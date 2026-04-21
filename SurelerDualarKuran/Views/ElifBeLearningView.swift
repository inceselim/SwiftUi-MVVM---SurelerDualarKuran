//
//  ElifBeLearningView.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import SwiftUI

struct ElifBeLearningView: View {
    @StateObject private var viewModel = ElifBeViewModel()

    private let columns = [
        GridItem(.adaptive(minimum: 86), spacing: 12)
    ]

    var body: some View {
        NavigationStack {
            Group {
                if let errorMessage = viewModel.errorMessage {
                    ContentUnavailableView(
                        "Veri okunamadı",
                        systemImage: "exclamationmark.triangle",
                        description: Text(errorMessage)
                    )
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            introSection
                            marksSection
                            lettersSection
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Elif Be")
            .navigationDestination(for: ElifBeLetter.self) { letter in
                ElifBeLetterDetailView(letter: letter)
            }
        }
    }

    private var introSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Kur'an Harfleri", systemImage: "character.book.closed")
                .font(.headline)
                .foregroundStyle(.teal)

            Text("Harfleri sırayla incele, örnek okunuşlarını gör ve temel harekelerle okumaya başla.")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var marksSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Temel Harekeler")
                .font(.title3.bold())

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.marks) { mark in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(mark.arabic)
                                .font(.system(size: 42, weight: .semibold))
                                .frame(width: 64, height: 54)
                                .background(.teal.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                            Text(mark.name)
                                .font(.headline)

                            Text(mark.reading)
                                .font(.subheadline.weight(.semibold))
                                .foregroundStyle(.teal)

                            Text(mark.note)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(3)
                        }
                        .frame(width: 150, alignment: .leading)
                        .padding(12)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                }
                .padding(.vertical, 2)
            }
        }
    }

    private var lettersSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Harfler")
                .font(.title3.bold())

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(viewModel.letters) { letter in
                    NavigationLink(value: letter) {
                        VStack(spacing: 8) {
                            Text(letter.arabic)
                                .font(.system(size: 48, weight: .bold))
                                .frame(height: 56)

                            Text(letter.name)
                                .font(.headline)
                                .foregroundStyle(.primary)

                            Text(letter.exampleReading)
                                .font(.caption.weight(.semibold))
                                .foregroundStyle(.teal)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    ElifBeLearningView()
}
