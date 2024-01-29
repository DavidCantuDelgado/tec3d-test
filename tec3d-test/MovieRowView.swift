//
//  MovieRowView.swift
//  tec3d-test
//
//  Created by David Cantú Delgado on 29/01/24.
//

import SwiftUI

struct MovieRowView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.title)
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            } placeholder: {
                ProgressView()
            }
                
            Text(movie.overview)
        }
    }
}

#Preview {
    MovieRowView(movie: Movie.sample)
}
