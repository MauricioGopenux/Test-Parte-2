//
//  TableViewDataSource.swift
//  PruebaTest2
//
//  Created by Radmas on 28/02/25.
//
import Foundation
import UIKit




final class TableViewDataSource: NSObject, UITableViewDataSource {
    
    private let dataSource: [Device]
    
    init(dataSource: [Device]) {
        self.dataSource = dataSource
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMovies", for: indexPath) as! MoviesTableViewCell
        
        let model = dataSource[indexPath.row]
        cell.deviceImageView.image = UIImage(named: model.imageName)
        cell.titleLabel.text = model.title
        
        return cell
        
    }
    
    func getMovies() -> [Device] {
        interactor.getMovies()
    }
}
    
