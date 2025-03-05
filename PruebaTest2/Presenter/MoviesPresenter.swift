//
//  MoviesPresenter.swift
//  PruebaTest2
//
//  Created by Radmas on 3/03/25.
//

import Foundation
import UIKit

final class MoviesPresenter {
    
    private let movieRepo: MovieRepository = MovieRepository()
    
    var movies: [Movie] = []


    func loadMovies() {
        movies = movieRepo.getMovies()
    }
    
    
    func showMovieResumen(movieId: IndexPath, referenceVC: UIViewController) {
        let movieId: Int = movies[movieId.row].id
        let resumenPresenter: ResumenMoviePresenter = ResumenMoviePresenter()
        resumenPresenter.setMovie(movieId: movieId)
        let resumenVC: ResumenViewController = ResumenViewController(resumenPresenter: resumenPresenter)
        referenceVC.present(resumenVC, animated: true)

    }
    
    func deleteMovies(){
        movies.removeAll()
    }
}



