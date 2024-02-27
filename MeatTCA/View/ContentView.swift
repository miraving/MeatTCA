//
//  ContentView.swift
//  MeatTCA
//
//  Created by miraving on 26.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack(alignment: .center) {
            if let uDate = store.dateUpdate {
                VStack {
                    Text("Update time")
                    Text(uDate, style: .relative)
                }
            }
            
            Text("\(store.count)")
                .font(.custom("Cochin", fixedSize: 142))
            
            HStack(alignment: .center, spacing: 20) {
                AButton(title: "Plus") {
                    store.send(.increment)
                }
                AButton(title: "Minus") {
                    store.send(.decrement)
                }
            }
            
            AButton(title: "Reset", color: .red) {
                store.send(.reset)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(store: Store(initialState: CounterFeature.State()) {
        CounterFeature()
    })
}

struct AButton: View {
    @Environment(\.colorScheme) var colorScheme
    @State var title: String
    var color: Color = .accentColor
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: { action?() }, label: { Text(title) })
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
//                .foregroundStyle(colorScheme == .light ? .black : .white)
            .foregroundColor(.white)
            .background {
                Rectangle()
                    .fill(color)
                    .cornerRadius(9)
            }
    }
}
