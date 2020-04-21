//
//  RequestModifier.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 5/26/19.
//  Copyright © 2019 aaplab. All rights reserved.
//

import Foundation

protocol RequestModifier {
    func modifyRequest(_ request: URLRequest) -> URLRequest
}

struct ApiKeyModifier: RequestModifier {
    private enum Keys {
        static let clientId = "1f481b53997fd687e4956e97747af94f41a502460ce18d0bff8c65640072fc57"
    }

    func modifyRequest(_ request: URLRequest) -> URLRequest {
        var request = request
        request.addValue(Keys.clientId, forHTTPHeaderField: "trakt-api-key")
        request.addValue("2", forHTTPHeaderField: "trakt-api-version")
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        return request
    }
}
