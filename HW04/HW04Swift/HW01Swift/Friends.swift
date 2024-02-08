//
//  Friends.swift
//  HW01Swift
//
//  Created by Kirill on 31/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

import Foundation

struct Friends: Decodable {
    let response: FriendsItems
}

struct FriendsItems: Decodable {
    let items: [Friend]
}

struct Friend: Decodable {
    let firstName: String
    let lastName: String
    let photo: String
    let online: Int
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case online
    }
}
