//
//  ShelfView.swift
//  TraktTV
//
//  Created by Majid Jabrayilov on 4/21/20.
//  Copyright © 2020 Majid Jabrayilov. All rights reserved.
//
import SwiftUI

struct ShelfView: View {
    @EnvironmentObject var store: SearchStore

    let title: String
    let shows: [Show]

    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)

                HStack {
                    ForEach(shows, id: \.ids) { show in
                        PosterView(
                            image: self.store.posters[show.ids.tmdb ?? 0],
                            title: show.title
                        )
                    }
                }
            }.padding()
        }
    }
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        let loader = DataLoader(session: .shared, modifiers: [])
        let search = SearchService(loader: loader, decoder: .init())
        let image = ImageService(loader: loader, decoder: .init())
        let store = SearchStore(searchService: search, imageService: image)
        return ShelfView(title: "Trending", shows: [])
            .environmentObject(store)
    }
}
