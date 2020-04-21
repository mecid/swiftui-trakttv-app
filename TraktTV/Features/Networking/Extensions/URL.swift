//
//  URL.swift
//  ShowBot
//
//  Created by Majid Jabrayilov on 12/19/18.
//  Copyright © 2018 aaplab. All rights reserved.
//

import Foundation

extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid URL string: \(string)")
        }

        self = url
    }
}
