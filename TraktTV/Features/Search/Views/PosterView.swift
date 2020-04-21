//
//  PosterView.swift
//  TraktTV
//
//  Created by Majid Jabrayilov on 4/21/20.
//  Copyright © 2020 Majid Jabrayilov. All rights reserved.
//
import SwiftUI
import KingfisherSwiftUI

struct PosterView: View {
    let image: URL?
    let title: String

    @State private var isFocused = false

    var body: some View {
        VStack {
            image.map {
                KFImage($0)
                    .resizable()
                    .background(Color.gray)
                    .frame(width: 400, height: 235, alignment: .center)
            }
            .cornerRadius(16)
            .shadow(radius: 16)

            if isFocused {
                Text(title)
            }
        }
        .scaleEffect(isFocused ? 1.05 : 1.0)
        .focusable(true) { self.isFocused = $0 }
        .animation(.default)
    }
}
