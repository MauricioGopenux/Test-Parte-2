//
//  MoviesDatabase.swift
//  PruebaTest2
//
//  Created by Radmas on 3/03/25.
//

import Foundation

let movies = [
    Movie(title: "Superman", imageName: "superman", overview: "Superman is a superhero who fights crime in Metropolis."),
    Movie(title: "Inferno", imageName: "inferno", overview: "Inferno is a superhero who fights crime in Metropolis."),
    Movie(title: "Avengers: DoomsDay", imageName: "doomsday", overview: "Avengers: DoomsDay is a superhero who fights crime in Metropolis."),
    Movie(title: "DeadPool & Wolverine", imageName: "deadpool3", overview: "DeadPool & Wolverine is a superhero who fights crime in Metropolis."),
    Movie(title: "El Conjuro", imageName: "conjuro", overview:"El Conjuro is a superhero who fights crime in Metropolis.")
]

final class MoviesDatabase{

    var listMovies: [Movie]
    
    init(listMovies: [Movie] = []) {
        self.listMovies = listMovies
    }
    
}

