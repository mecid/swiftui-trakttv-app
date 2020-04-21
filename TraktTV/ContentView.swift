//
//  ContentView.swift
//  TraktTV
//
//  Created by Majid Jabrayilov on 4/20/20.
//  Copyright © 2020 Majid Jabrayilov. All rights reserved.
//
import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    @EnvironmentObject var store: SearchStore

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(SearchType.allCases, id: \.self) { type in
                        ShelfView(
                            title: type.rawValue.capitalized,
                            shows: self.store.listOfShows(for: type)
                        )
                    }
                }
            }.onAppear(perform: store.fetch)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
