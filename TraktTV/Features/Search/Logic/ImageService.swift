//
//  ImageService.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 1/3/19.
//  Copyright © 2019 aaplab. All rights reserved.
//
import Combine
import Foundation

final class ImageService {
    private let loader: DataLoader
    private let decoder: JSONDecoder

    init(loader: DataLoader, decoder: JSONDecoder) {
        self.loader = loader
        self.decoder = decoder
    }

    func fetch(for show: Int) -> AnyPublisher<TMDBImages, Error> {
        return loader
            .load(ImagesRequest(show: show))
            .decode(type: TMDBImages.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
