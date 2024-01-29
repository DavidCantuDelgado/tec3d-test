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
                    Text(Movie.sample.title)
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
