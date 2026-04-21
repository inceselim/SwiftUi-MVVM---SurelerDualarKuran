//
//  RootView.swift
//  SurelerDualarKuran
//
//  Created by Selim ince on 20.04.2026.
//

import SwiftUI

struct RootView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab){
            SurelerView()
                .tabItem(){
                    Image(systemName: "moon")
                    Text("Sureler")
                }
                .tag(0)
            DualarView()
                .tabItem(){
                    Image(systemName: "moon.stars")
                    Text("Dualar")
                }
                .tag(1)
            KuranView()
                .tabItem(){
                    Image(systemName: "book")
                    Text("Kuran")
                }
                .tag(2)
                .badge(0)
        }
    }
}

#Preview {
    RootView()
}
