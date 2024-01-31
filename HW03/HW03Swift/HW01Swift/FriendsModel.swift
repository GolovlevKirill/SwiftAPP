//
//  Friends.swift
//  HW01Swift
//
//  Created by Kirill on 31/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let trackCode: String
    let photo50: String
    let firstName, lastName: String
    let canAccessClosed, isClosed: Bool
    let deactivated: Deactivated?

    enum CodingKeys: String, CodingKey {
        case id
        case trackCode = "track_code"
        case photo50 = "photo_50"
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case deactivated
    }
}

enum Deactivated: String, Codable {
    case banned = "banned"
    case deleted = "deleted"
}
