//
//  Images.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 1/3/19.
//  Copyright © 2019 aaplab. All rights reserved.
//
import Foundation

struct Still: Codable {
    let filePath: String
    let aspectRatio: Double
}

extension Still {
    var url: URL? {
        return URL(string: "https://image.tmdb.org/t/p/original\(filePath)")
    }
}

struct TMDBImages: Codable {
    let id: Int
    let backdrops: [Still]
    let posters: [Still]
}
