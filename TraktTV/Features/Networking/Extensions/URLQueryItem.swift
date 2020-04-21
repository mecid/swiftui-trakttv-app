//
//  URLQueryItem.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 3/17/19.
//  Copyright © 2019 aaplab. All rights reserved.
//

import Foundation

extension URLQueryItem {
    static func limit(value: Int) -> URLQueryItem {
        return .init(name: "limit", value: String(value))
    }

    static func extended(value: String = "full") -> URLQueryItem {
        return .init(name: "extended", value: value)
    }

    static func query(value: String) -> URLQueryItem {
        return .init(name: "query", value: value)
    }
}
