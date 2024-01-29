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
            Image(movie.poster_path!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            Text(movie.overview)
        }
    }
}

#Preview {
    MovieRowView(movie: Movie.sample)
}
