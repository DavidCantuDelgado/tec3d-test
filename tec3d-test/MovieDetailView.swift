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
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.width-40)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    
                                    ShareLink(item
                                              : image,
                                              message: (Text(movie.overview)), preview: SharePreview(
                                                movie.title,
                                                image: image
                                              )) {
                                                  Image(systemName: "square.and.arrow.up.circle")
                                                      .font(.title)
                                                      .foregroundStyle(.red)
                                                      .padding(.trailing, 10)
                                                      .padding(.bottom, 10)
                                              }
                                }
                            }
                        }
                } placeholder: {
                    ProgressView()
                }
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
