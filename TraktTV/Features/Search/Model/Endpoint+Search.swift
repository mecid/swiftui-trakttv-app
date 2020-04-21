//
//  Endpoint+Search.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 12/21/18.
//  Copyright © 2018 aaplab. All rights reserved.
//

import Foundation

enum SearchType: String, CaseIterable {
    case popular
    case trending
    case anticipated
}

extension Endpoint {
    static func search(in type: SearchType, limit: Int = 20) -> Endpoint {
        return Endpoint(
            path: "/shows/\(type.rawValue)",
            queryItems: [.extended(), .limit(value: limit)]
        )
    }
}
