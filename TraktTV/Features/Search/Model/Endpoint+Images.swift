//
//  ImagesRequest.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 1/3/19.
//  Copyright © 2019 aaplab. All rights reserved.
//
import Foundation

struct ImagesRequest: Request {
    let show: Int

    var host: String { "api.themoviedb.org" }
    var path: String { return "/3/tv/\(show)/images" }
    var queryItems: [URLQueryItem] {
        [
            .init(name: "api_key", value: "26032f00317cb09595066add499cb5b4"),
            .init(name: "language", value: "en")
        ]
    }
}
