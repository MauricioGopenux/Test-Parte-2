//
//  MovieRepository.swift
//  PruebaTest2
//
//  Created by Radmas on 4/03/25.
//

import Foundation

final class MovieRepository {
    func getMovies() -> [Movie]{
        movies
    }
    
    func getMovieById(movieId: Int) -> Movie? {
        movies.first(where: { $0.id == movieId })
    }
}
