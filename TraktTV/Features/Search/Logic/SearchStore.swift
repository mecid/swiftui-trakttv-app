//
//  SearchStore.swift
//  TraktTV
//
//  Created by Majid Jabrayilov on 4/20/20.
//  Copyright © 2020 Majid Jabrayilov. All rights reserved.
//
import Foundation
import Combine

final class SearchStore: ObservableObject {
    @Published private(set) var allShows: [Ids: Show] = [:]
    @Published private(set) var posters: [Int: URL] = [:]
    @Published private(set) var categories: [SearchType: [Ids]] = [:]

    private var cancellables: Set<AnyCancellable> = []

    private let searchService: SearchService
    private let imageService: ImageService

    init(searchService: SearchService, imageService: ImageService) {
        self.searchService = searchService
        self.imageService = imageService
    }

    func fetch() {
        fetchShows(for: .popular)
        fetchShows(for: .trending)
        fetchShows(for: .anticipated)
    }

    func listOfShows(for type: SearchType) -> [Show] {
        let ids = categories[type] ?? []
        return ids.compactMap { allShows[$0] }
    }

    private func fetchShows(for type: SearchType) {
        searchService
            .fetchShows(in: type)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { [weak self] shows in
                shows.forEach { self?.allShows[$0.ids] = $0 }
                self?.categories[type] = shows.map { $0.ids }
            })
            .receive(on: DispatchQueue.global())
            .flatMap {
                Publishers.Sequence(sequence: $0)
                    .flatMap { self.imageService.fetch(for: $0.ids.tmdb ?? 0) }
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { _ in },
            receiveValue: { [weak self] in self?.posters[$0.id] = $0.backdrops.first?.url }
        )
        .store(in: &cancellables)
    }
}
