//
//  User.swift
//  MeatTCA
//
//  Created by miraving on 26.02.2024.
//

import Foundation

struct User: Decodable {
    let login: String
    let id: Int
    let nodeId: String
    let avatarUrl: URL
    let gravatarId: String?
    let url: URL
    let htmlUrl: URL
    let followersUrl: URL
    let followingUrl: URL
    let gistsUrl: URL
    let starredUrl: URL
    let subscriptionsUrl: URL
    let organizationsUrl: URL
    let reposUrl: URL
    let eventsUrl: URL
    let receivedEventsUrl: URL
    let type: String
    let siteAdmin: Bool
    let name: String
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: String?
    let bio: String?
    let twitterUsername: String?
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
//    let createdAt: Date
//    let updatedAt: Date
    
    static var mock: User? {
        let json =
"""
{"login":"miraving","id":2398386,"node_id":"MDQ6VXNlcjIzOTgzODY=","avatar_url":"https://avatars.githubusercontent.com/u/2398386?v=4","gravatar_id":"","url":"https://api.github.com/users/miraving","html_url":"https://github.com/miraving","followers_url":"https://api.github.com/users/miraving/followers","following_url":"https://api.github.com/users/miraving/following{/other_user}","gists_url":"https://api.github.com/users/miraving/gists{/gist_id}","starred_url":"https://api.github.com/users/miraving/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/miraving/subscriptions","organizations_url":"https://api.github.com/users/miraving/orgs","repos_url":"https://api.github.com/users/miraving/repos","events_url":"https://api.github.com/users/miraving/events{/privacy}","received_events_url":"https://api.github.com/users/miraving/received_events","type":"User","site_admin":false,"name":"Vitalii Obertynskyi","company":null,"blog":"https://goo.gl/xQ1HY6","location":"Lviv (Ukraine)","email":null,"hireable":null,"bio":" Engineer","twitter_username":"_miraving","public_repos":23,"public_gists":0,"followers":14,"following":17,"created_at":"2012-09-22T07:26:55Z","updated_at":"2024-02-26T12:22:00Z"}
"""
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try? decoder.decode(User.self, from: json.data(using: .utf8)!)
    }
}
