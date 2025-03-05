//
//  ResumenMoviePresenter.swift
//  PruebaTest2
//
//  Created by Radmas on 3/03/25.
//

import Foundation

protocol loadDataResumen: AnyObject {
    func configure(movie:Movie)
}

final class ResumenMoviePresenter {
    
    private let movieRepo: MovieRepository = MovieRepository()
    weak var delegate: loadDataResumen?
    var movieId: Int?
    
    func getMovieById() {
        guard let movieId: Int = movieId, let movie: Movie = movieRepo.getMovieById(movieId: movieId) else { return }
        delegate?.configure(movie: movie)
    }
    
    
    func setMovie(movieId: Int) {
        self.movieId = movieId
    }
}

