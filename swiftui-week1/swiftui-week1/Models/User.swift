//
//  User.swift
//  swiftui-week1
//
//  Created by mandoo on 3/23/26.
//

import Observation

@Observable
final class User {
    var name: String
    var bio: String
    var isPrivate: Bool

    init(name: String = "알 수 업서요", bio: String = "어떤 사람..?", isPrivate: Bool = false) {
        self.name = name
        self.bio = bio
        self.isPrivate = isPrivate
    }
}
