//
//  MovieDetailView.swift
//  tec3d-test
//
//  Created by David Cantú Delgado on 29/01/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    var size = UIScreen.main.bounds
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                Image(movie.poster_path!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width-40)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Fecha: \(movie.release_date)")
                Text("Popularidad: \(movie.vote_average, specifier: "%.2f") ")
                Text(movie.overview)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie.sample)
}
