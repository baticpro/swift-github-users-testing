//
//  User.swift
//  GitHubUsers
//
//  Created by batraz jioty on 10.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var bio: String?
    var publicRepos: Int 
    var publicGists: Int
    var htmlUrl: String
    var followers: Int
    var createdAt: String
}
