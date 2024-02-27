//
//  GitHubView.swift
//  MeatTCA
//
//  Created by miraving on 26.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct GitHubView: View {
    let store: StoreOf<GitHubFeature>
    
    @State private var userName: String = "miraving"
    
    var body: some View {
        VStack {
            
            switch store.fState {
            case .error:
                Text("ERRØR::")
                
            case .user:
                if let model = store.model {
                    AsyncImage(url: model.avatarUrl) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 120, height: 120)
                    
                    Text(model.name)
                    Text(model.bio ?? "no bio")
                    Text(model.htmlUrl.absoluteString)
                    
                    HStack {
                        VStack {
                            Text("Repo")
                            Text(model.publicRepos, format: .number)
                        }
                        
                        Text("|")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                        
                        VStack {
                            Text("Followers")
                            Text(model.followers, format: .number)
                        }
                        
                        Text("|")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                        
                        VStack {
                            Text("Following")
                            Text(model.following, format: .number)
                        }
                    }
                    .padding()
                    
                } else {
                    ContentUnavailableView("No Data", image: "person")
                }
                
            case .loading:
                ProgressView {
                    Text("Updating...")
                        .font(.largeTitle)
                }
            }
            VStack {
                TextField("enter user name", text: $userName)
                    .textFieldStyle(.roundedBorder)
                
                AButton(title: "Get data") {
                    store.send(.getUser(userName))
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
        .onAppear {
            store.send(.getUser(userName))
        }
    }
}

#Preview {
    GitHubView(store: Store(initialState: GitHubFeature.State(model: User.mock)) {
        GitHubFeature()
    })
}
