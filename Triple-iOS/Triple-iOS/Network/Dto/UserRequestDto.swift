//
//  UserRequestDto.swift
//  Triple-iOS
//
//  Created by 고두영 on 2022/12/01.
//

import Foundation

// MARK: - Welcome
struct SaveRequestDto: Codable {
    let planList: [PlanList]?
}

// MARK: - PlanList
struct PlanList: Codable {
    let dayID: Int
    let time, content: String

    enum CodingKeys: String, CodingKey {
        case dayID = "dayId"
        case time, content
    }
}
