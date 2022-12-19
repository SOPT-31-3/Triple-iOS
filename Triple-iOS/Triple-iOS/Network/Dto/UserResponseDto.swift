//
//  UserResponseDto.swift
//  Triple-iOS
//
//  Created by 고두영 on 2022/12/01.
//

import Foundation

// MARK: - Welcome
struct SaveResponsetDto: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let city: String
}
