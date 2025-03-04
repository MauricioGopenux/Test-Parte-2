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
    
    private var movieRepo: MovieRepository = MovieRepository()
    weak var delegate: loadDataResumen?
    var movieId: Int?
    
    func getMovieById() {
        guard let movieId: Int = movieId else { return }
        let movie: Movie = movieRepo.getMovieById(movieId: movieId)
        delegate?.configure(movie: movie)
    }
    
    
    func setMovie(movieId: Int) {
        self.movieId = movieId
    }
}

