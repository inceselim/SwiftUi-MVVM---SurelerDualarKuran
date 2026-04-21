//
//  DuaDetailView.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import SwiftUI

struct DuaDetailView: View {
    let dua: Dua
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text(dua.title)
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)

                    DetailTextSection(title: "Dua", systemImage: "text.quote", text: dua.c1)
                    DetailTextSection(title: "Anlamı", systemImage: "text.book.closed", text: dua.d1)
                    DetailTextSection(title: "Bilgi", systemImage: "info.circle", text: dua.d2)

                    if let videoURL = youtubeURL(from: dua.link1) {
                        Link(destination: videoURL) {
                            Label("Videoyu Aç", systemImage: "play.circle.fill")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.teal)
                        .padding(.top, 6)
                    }
                }
                .padding()
            }
            .navigationTitle(dua.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    
    private func youtubeURL(from videoID: String) -> URL? {
        guard !videoID.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return nil
        }

        return URL(string: "https://www.youtube.com/watch?v=\(videoID)")
    }
}

#Preview {
    DuaDetailView(
        dua: Dua(
            title: "Subhaneke",
            c1: "Subhanekellahumme ve bi hamdik.",
            d1: "Duanın anlamı burada gösterilir.",
            d2: "",
            link1: ""
        )
    )
}
