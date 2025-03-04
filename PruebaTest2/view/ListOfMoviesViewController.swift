//
//  ListOfMoviesViewController.swift
//  PruebaTest2
//
//  Created by Radmas on 3/03/25.
//

import UIKit

class ListOfMoviesViewController: UIViewController {

    @IBOutlet weak var countMovies: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var MoviesTable: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var moviePresenter = MoviesPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moviePresenter.delegate = self
        moviePresenter.loadMovies()
       
        
        MoviesTable.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "cellMovies")
        MoviesTable.dataSource = self
        MoviesTable.delegate = self
        
    }

    @IBAction func didTapRefresh(_ sender: Any) {
        
        moviePresenter.deleteMovies()
        MoviesTable.reloadData()
        countMovies.text = "Loading Movies ..."
        activityIndicator.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.moviePresenter.loadMovies()
            self.MoviesTable.reloadData()
            self.countMovies.text = "Movies: \(self.moviePresenter.movies.count)"
            self.activityIndicator.isHidden = true
        }
        
        
    }
}

extension ListOfMoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviePresenter.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMovies", for: indexPath) as! MoviesTableViewCell
        
        let model = moviePresenter.movies[indexPath.row]
        cell.deviceImageView.image = UIImage(named: model.imageName)
        cell.titleLabel.text = model.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId: Int = moviePresenter.movies[indexPath.row].id
        moviePresenter.getMovie(movieId: movieId, referenceVC: self)
        
    }
    
}

extension ListOfMoviesViewController: MoviePresenterDelegate {
    func showMovies(movie: [Movie]) {
        countMovies.text = "Movies: \(movie.count)"
    }
    
    
}



