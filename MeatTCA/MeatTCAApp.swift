//
//  MeatTCAApp.swift
//  MeatTCA
//
//  Created by miraving on 26.02.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct MeatTCAApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView(store: Store(initialState: CounterFeature.State()) {
                    CounterFeature()
                })
                .tabItem {
                    Image(systemName: "1.brakesignal")
                }
                
                GitHubView(store: Store(initialState: GitHubFeature.State(), reducer: {
                    GitHubFeature()
                }))
                .tabItem {
                    Image(systemName: "2.brakesignal")
                }
            }
            .tableStyle(.inset)
            .preferredColorScheme(.light)
        }
    }
}
