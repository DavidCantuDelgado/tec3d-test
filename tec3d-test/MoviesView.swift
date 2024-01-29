//
//  ContentView.swift
//  tec3d-test
//
//  Created by David Cantú Delgado on 29/01/24.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    VStack(alignment: .leading) {
                        Text(Movie.sample.title)
                            .font(.title)
                        Image(Movie.sample.poster_path!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                        Text(Movie.sample.overview)
                    }
                }
                .listStyle(.inset)
            }
            .padding()
            .navigationTitle("Películas")
        }
    }
}

#Preview {
    MoviesView()
}
