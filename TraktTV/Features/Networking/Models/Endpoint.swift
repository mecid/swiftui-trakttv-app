//
//  Endpoint.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 12/20/18.
//  Copyright © 2018 aaplab. All rights reserved.
//

import Foundation

struct Endpoint: Request {
    let path: String
    let queryItems: [URLQueryItem]
}
