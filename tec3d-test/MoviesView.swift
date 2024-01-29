//
//  ContentView.swift
//  tec3d-test
//
//  Created by David Cantú Delgado on 29/01/24.
//

import SwiftUI

struct MoviesView: View {
    
    @State var movies = [Movie]()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(movies) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieRowView(movie: movie)
                        }
                    }
                }
                .listStyle(.inset)
            }
            .padding()
            .navigationTitle("Películas")
            .onAppear {
                Task {
                    do {
                        movies = try await fetchMovies()
                    } catch {
                        print("Fetch failed: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func fetchMovies() async throws -> [Movie] {
        let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzUxMWUxOTQwNmI0MDNjZmNkMmNhZjUwNTM3ODMwYiIsInN1YiI6IjViZjM1YjEyMGUwYTI2MjY1YzA5MjcyZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BFDSYObw7NAI3JqKeaWgxXRc_MDlQw_7tT4dOGiHxas"
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=es-MX&page=1")
        var request = URLRequest(url: url!)
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(apiauth)",
            "Accept": "application/json",
            "Content-Type": "application/json"
            ]
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        return decodedResponse.results
    }

}

#Preview {
    MoviesView()
}
