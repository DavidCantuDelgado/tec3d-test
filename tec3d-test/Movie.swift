//
//  Movie.swift
//  tec3d-test
//
//  Created by David Cantú Delgado on 29/01/24.
//

import SwiftUI

struct Movie: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let release_date: String
    let poster_path: String?
    let vote_average: Double
}

extension Movie {
    public static let sample = Movie(
        id: 906126,
        title: "La sociedad de la nieve",
        overview: "El 13 de octubre de 1972, el vuelo 571 de la Fuerza Aérea Uruguaya, fletado para llevar a un equipo de rugby a Chile, se estrella en un glaciar en el corazón de los Andes.",
        release_date: "2023-12-13",
        poster_path: "/zBW3eu851EBSw9GinzRfYXeNI9e.jpg",
        vote_average: 8.059
      )
}
