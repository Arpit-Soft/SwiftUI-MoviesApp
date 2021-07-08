//
//  MoviesDetailView.swift
//  MoviesApp
//
//  Created by Arpit Dixit on 08/07/21.
//

import SwiftUI

struct MoviesDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        ZStack {
            VStack {
                URLImage(url: movie.poster)
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MoviesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesDetailView(movie: Movie(title: "Batman Begins", imdbId: "tt0372784", poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg", year: "2005"))
    }
}
