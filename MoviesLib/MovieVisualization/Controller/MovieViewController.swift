//
//  MovieViewController.swift
//  MoviesLib
//
//  Created by Bruno Oliveira on 30/08/22.
//

import UIKit

class MovieViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelSummary: UITextView!
    
    // MARK: - Properties
    var movie: Movie?
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieFormViewController = segue.destination as? MovieFormViewController {
            movieFormViewController.movie = movie
        }
    }
    
    // MARK: - IBActions
    @IBAction func play(_ sender: UIButton) {
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        if let  movie = movie {
            labelTitle.text = movie.title
            labelRating.text = movie.ratingFormatted
            labelSummary.text = movie.summary
            labelDuration.text = movie.duration
            if let image = movie.image {
                imageViewPoster.image = UIImage(data: image)
            }
            
            if let categories = movie.categories as? Set<Category> {
                labelCategories.text = categories.compactMap({$0.name}).sorted().joined(separator: " | ")
            }
        }
    }
}

