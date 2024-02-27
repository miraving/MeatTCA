//
//  CounterFeature.swift
//  MeatTCA
//
//  Created by miraving on 26.02.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct CounterFeature {
    @ObservableState
    struct State {
        var count = 0
        var dateUpdate: Date?
    }
    
    enum Action {
        case increment
        case decrement
        case reset
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .increment:
                state.count += 1
                state.dateUpdate = Date()
                return .none
                
            case .decrement:
                state.count -= 1
                state.dateUpdate = Date()
                return .none
            case .reset:
                state.count = 0
                state.dateUpdate = nil
                return .none
            }
        }
    }
}
