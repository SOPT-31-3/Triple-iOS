//
//  Router.swift
//  Triple-iOS
//
//  Created by 황찬미 on 2022/11/17.
//

import Foundation
import UIKit

import Moya

enum Router {
    case save(param: [PlanList])
}

extension Router: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .save(param: _):
            return "/trip/plan/allPlan"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .save(param: _):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .save(param: let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
