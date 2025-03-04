//
//  ResumenViewController.swift
//  PruebaTest2
//
//  Created by Radmas on 3/03/25.
//

import UIKit

class ResumenViewController: UIViewController {

    @IBOutlet weak var resumenImage: UIImageView!
    
    @IBOutlet weak var resumenTitle: UILabel!
    
    @IBOutlet weak var resumenText: UITextView!
    
    private var resumenPresenter = ResumenMoviePresenter()
    
    init( resumenPresenter: ResumenMoviePresenter) {
        super.init(nibName: nil, bundle: nil)
        self.resumenPresenter = resumenPresenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resumenPresenter.delegate = self
        resumenPresenter.getMovieById()
    }
}

extension ResumenViewController: loadDataResumen {
    func configure(movie: Movie) {
        resumenTitle.text = movie.title
        resumenText.text = movie.overview
        resumenImage.image = UIImage(named: movie.imageName)
    }
}

