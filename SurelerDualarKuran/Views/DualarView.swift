//
//  DualarView.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 20.04.2026.
//

import SwiftUI

struct DualarView: View {
    @State private var viewModel = DuaListViewModel()
    
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
                        List(viewModel.dualar) { dua in
                            NavigationLink(value: dua) {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(dua.title)
                                        .font(.headline)

                                    Text(dua.c1)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(2)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                .navigationTitle("Dualar")
                .navigationDestination(for: Dua.self) { dua in
                    DuaDetailView(dua: dua)
                }
            }
        }
}

#Preview {
    DualarView()
}
