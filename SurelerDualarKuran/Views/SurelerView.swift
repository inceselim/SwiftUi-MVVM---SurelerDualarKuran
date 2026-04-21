//
//  ContentView.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 20.04.2026.
//

import SwiftUI

struct SurelerView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Sureler!")
            }
            .padding()
        }
    }
}

#Preview {
    SurelerView()
}
