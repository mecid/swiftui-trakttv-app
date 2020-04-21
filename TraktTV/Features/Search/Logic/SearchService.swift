//
//  SearchService.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 3/17/19.
//  Copyright © 2019 aaplab. All rights reserved.
//
import Combine
import Foundation

final class SearchService {
    private let loader: DataLoader
    private let decoder: JSONDecoder

    init(loader: DataLoader, decoder: JSONDecoder) {
        self.loader = loader
        self.decoder = decoder
    }

    private struct ShowContainer: Decodable {
        let show: Show
    }

    func fetchShows(in type: SearchType, limit: Int = 20) -> AnyPublisher<[Show], Error> {
        if case .popular = type {
            return loader.load(Endpoint.search(in: type, limit: limit))
                .decode(type: [Show].self, decoder: decoder)
                .eraseToAnyPublisher()
        } else {
            return loader.load(Endpoint.search(in: type, limit: limit))
                .decode(type: [ShowContainer].self, decoder: decoder)
                .map { $0.map(\.show) }
                .eraseToAnyPublisher()
        }
    }
}
