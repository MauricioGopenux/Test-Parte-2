//
//  MoviesPresenter.swift
//  PruebaTest2
//
//  Created by Radmas on 3/03/25.
//

import Foundation
import UIKit

protocol MoviePresenterDelegate: AnyObject {
    func showMovies(movie: [Movie])
}

final class MoviesPresenter {
    
    private var movieRepo: MovieRepository = MovieRepository()
    
    weak var delegate: MoviePresenterDelegate?
    
    private var resumenPresenter: ResumenMoviePresenter = ResumenMoviePresenter()
    
    var movies: [Movie] = []


    func loadMovies() {
        movies = movieRepo.getMovies()
        delegate?.showMovies(movie: movies)
    }
    
    
    func getMovie(movieId: Int, referenceVC: UIViewController) {
        
        let resumenPresenter: ResumenMoviePresenter = ResumenMoviePresenter()
        resumenPresenter.setMovie(movieId: movieId)
        let resumenVC: ResumenViewController = ResumenViewController(resumenPresenter: resumenPresenter)
        referenceVC.present(resumenVC, animated: true)

    }
    
    func deleteMovies(){
        movies.removeAll()
    }
}



