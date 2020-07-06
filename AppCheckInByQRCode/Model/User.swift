//
//  User.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/6/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

// MARK: - User
struct User: Codable {
    let message: String
    let user: UserClass
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case message, user
        case accessToken = "access_token"
    }
}

// MARK: - UserClass
struct UserClass: Codable {
    let id: Int
    let name, email, phone, address: String
    let avatar: String
    let roleID, status: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, address, avatar
        case roleID = "role_id"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
