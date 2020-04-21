//
//  Show.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 12/21/18.
//  Copyright © 2018 aaplab. All rights reserved.
//

import Foundation

struct Show: Codable, Hashable {
    let ids: Ids
    let title: String
    let year: Int?
    let overview: String?
    let runtime: Int?
    let certification: String?
    let network: String?
    let country: String?
    let trailer: String?
    let homepage: String?
    let status: String?
    let rating: Double?
    let votes: Int?
    let commentCount: Int?
    let updatedAt: Date?
    let language: String?
    let availableTranslations: [String]?
    let genres: [String]?
    let airedEpisodes: Int?
}

struct Ids: Codable, Hashable {
    let trakt: Int
    let tvdb: Int?
    let tmdb: Int?
    let slug: String?
    let imdb: String?
}
