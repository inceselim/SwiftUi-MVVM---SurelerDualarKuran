//
//  ContentView.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 20.04.2026.
//

import SwiftUI

struct SurelerView: View {
    @StateObject private var viewModel = SureListViewModel()

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
                            List(viewModel.sureler) { sure in
                                NavigationLink(value: sure) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(sure.title)
                                            .font(.headline)

                                        Text(sure.c1)
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
                    .navigationTitle("Sureler")
                    .navigationDestination(for: Sure.self) { sure in
                        SureDetailView(sure: sure)
                    }
                }
    }
}

#Preview {
    SurelerView()
}
