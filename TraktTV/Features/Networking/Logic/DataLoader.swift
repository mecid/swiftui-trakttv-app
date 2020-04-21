//
//  DataLoader.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 12/19/18.
//  Copyright © 2018 aaplab. All rights reserved.
//
import Combine
import Foundation

final class DataLoader {
    private let session: URLSession
    private let modifiers: [RequestModifier]

    init(session: URLSession = .shared, modifiers: [RequestModifier] = []) {
        self.session = session
        self.modifiers = modifiers
    }

    func load(_ request: Request) -> AnyPublisher<Data, Error> {
        let modifiedRequest = modifiers.reduce(request.build()) { $1.modifyRequest($0) }

        return session
            .dataTaskPublisher(for: modifiedRequest)
            .mapError { $0 }
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
