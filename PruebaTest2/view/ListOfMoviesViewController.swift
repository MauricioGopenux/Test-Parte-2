//
//  ListOfMoviesViewController.swift
//  PruebaTest2
//
//  Created by Radmas on 3/03/25.
//

import UIKit

class ListOfMoviesViewController: UIViewController {

    @IBOutlet private weak var countMovies: UILabel!
    @IBOutlet private weak var refreshButton: UIButton!
    @IBOutlet private weak var MoviesTable: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private let moviePresenter: MoviesPresenter = MoviesPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activityIndicator.stopAnimating()
        moviePresenter.loadMovies()
       
        MoviesTable.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "cellMovies")
        MoviesTable.dataSource = self
        MoviesTable.delegate = self
        
    }

    @IBAction func didTapRefresh(_ sender: Any) {
        
        moviePresenter.deleteMovies()
        countMovies.text = "Loading Movies ..."
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        MoviesTable.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.moviePresenter.loadMovies()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.MoviesTable.reloadData()
        }
        
        
    }
}

extension ListOfMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviePresenter.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        countMovies.text = "Movies: \(self.moviePresenter.movies.count)"
        let cell: MoviesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMovies", for: indexPath) as! MoviesTableViewCell
        
        let movie: Movie = moviePresenter.movies[indexPath.row]
        cell.configure(movie: movie)
        return cell
    }
}

extension ListOfMoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let movieId: Int = moviePresenter.movies[indexPath.row].id
        moviePresenter.showMovieResumen(movieId: indexPath, referenceVC: self)
        
    }
}



