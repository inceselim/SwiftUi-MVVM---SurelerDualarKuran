//
//  SurelerDetailView.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 21.04.2026.
//

import SwiftUI

struct SureDetailView: View {
    let sure: Sure

    private func youtubeURL(from videoID: String) -> URL? {
        guard !videoID.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            return nil
        }

        return URL(string: "https://www.youtube.com/watch?v=\(videoID)")
    }
    
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        Text(sure.title)
                            .font(.largeTitle.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)

                        DetailTextSection(title: "Okunuşu", systemImage: "text.quote", text: sure.c1)
                        DetailTextSection(title: "Meali", systemImage: "text.book.closed", text: sure.d1)
                        DetailTextSection(title: "Açıklama", systemImage: "info.circle", text: sure.d2)

                        if let videoURL = youtubeURL(from: sure.link1) {
                            Link(destination: videoURL) {
                                Label("Dinle", systemImage: "play.circle.fill")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.blue)
                            .padding(.top, 6)
                        }
                    }
                    .padding()
                }
                .navigationTitle(sure.title)
                .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SureDetailView(
        sure: Sure(
            title: "Fatiha",
            c1: "Elhamdulillahi rabbil alemin.",
            d1: "Surenin meali burada gösterilir.",
            d2: "",
            link1: ""
        )
    )
}
