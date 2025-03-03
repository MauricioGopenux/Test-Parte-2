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
    
    
    private var dataSource: TableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countMovies.text = "Movies: \(movies.count)"
        
        MoviesTable.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "cellMovies")

        
        self.dataSource = TableViewDataSource(dataSource: movies)
        MoviesTable.dataSource = dataSource
        
        MoviesTable.delegate = self
     
        MoviesTable.reloadData()
    }

    @IBAction func didTapOnRefresh(_ sender: Any) {
        
        
        
        let activityIndicatorViewController = RefreshViewController()
            activityIndicatorViewController.view.frame = view.bounds
            activityIndicatorViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
               view.addSubview(activityIndicatorViewController.view)
               addChild(activityIndicatorViewController)
               activityIndicatorViewController.didMove(toParent: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
         
            activityIndicatorViewController.willMove(toParent: nil)
                     activityIndicatorViewController.removeFromParent()
                     activityIndicatorViewController.view.removeFromSuperview()
        }
    }
}

extension ListOfMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let overView = ResumenViewController()
               if let sheet = overView.sheetPresentationController {
                   sheet.detents = [ .large()]
                   sheet.selectedDetentIdentifier = .large
                   sheet.prefersGrabberVisible = true
                   sheet.preferredCornerRadius = 15
               }
        present(overView, animated: true, completion: nil)
        let model = movies[indexPath.row]
        
        overView.resumenImage?.image = UIImage(named: model.imageName)
        overView.resumenTitle?.text = model.title
        overView.resumenText?.text = model.overview
    }
}
