//
//  Profile.swift
//  HW01Swift
//
//  Created by Kirill on 09/02/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

struct ProfileModel: Decodable {
    let response: Profile
}

struct Profile: Decodable {
    let firstName: String
    let lastName: String
    let photo: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_200"
    }
}
