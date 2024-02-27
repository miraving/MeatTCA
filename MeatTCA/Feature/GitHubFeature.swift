//
//  GitHubFeature.swift
//  MeatTCA
//
//  Created by miraving on 26.02.2024.
//

import Foundation
import ComposableArchitecture
import SwiftUI

@Reducer
struct GitHubFeature {
    private let session = URLSession(configuration: URLSessionConfiguration.default)
    
    
    @ObservableState
    struct State {
        var fState: FeatureState = .loading
        var model: User?
        var error: String?
    }
    
    enum Action {
        case getUser(String)
        case userResponse(User)
        case userError
    }
    
    enum FeatureState {
        case loading
        case user
        case error
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .getUser(let name):
                state.fState = .loading
                return .run { send in
                    let url = URL(string: "https://api.github.com/users/\(name)")!
                    let (data, _) = try await session.data(from: url)
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    if let user = try? decoder.decode(User.self, from: data) {
                        await send(.userResponse(user))
                    } else {
                        await send(.userError)
                    }
                }
            
            case .userResponse(let user):
                state.model = user
                state.fState = .user
                return .none
                
            case .userError:
                state.error = "Loading is broken"
                state.fState = .error
                return .none
            }
        }
    }
}
