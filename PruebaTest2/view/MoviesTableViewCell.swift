//
//  MoviesTableViewCell.swift
//  PruebaTest2
//
//  Created by Radmas on 28/02/25.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet private weak var deviceImageView: UIImageView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(movie: Movie) {
        deviceImageView.image = UIImage(named: movie.imageName)
        titleLabel.text = movie.title
        
    }
}
