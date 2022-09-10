//
//  MovieFormViewController.swift
//  MoviesLib
//
//  Created by Bruno Oliveira on 08/09/22.
//

import UIKit

class MovieFormViewController: UIViewController {

    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldRating: UITextField!
    @IBOutlet weak var textFieldDuration: UITextField!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var textViewSummary: UITextView!
    @IBOutlet weak var buttonSave: UIButton!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let movie = movie {
            title = "Atualizaçao de filme"
            textFieldTitle.text = movie.title
            textFieldRating.text = "\(movie.rating)"
            textFieldDuration.text = movie.duration
            textViewSummary.text = movie.summary
            buttonSave.setTitle("Atualizar", for: .normal)
//            labelCategories.text = ""
            if let image = movie.image {
                imageViewPoster.image = UIImage(data: image)
            }
        }
    }
    
    
    @IBAction func selectImage(_ sender: UIButton) {
        let alert = UIAlertController(title: "Selecionar Poster", message: "De onde vc deseja escolher o pôster", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "camera", style: .default) { _ in
                self.selectPictureFrom(.camera)
            }
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default) { _ in
            self.selectPictureFrom(.photoLibrary)
        }
        alert.addAction(libraryAction)
        
        
        let photosAction = UIAlertAction(title: "Album de fotos", style: .default) { _ in
            self.selectPictureFrom(.savedPhotosAlbum)
        }
        alert.addAction(photosAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    
    private func selectPictureFrom(_ sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        present(imagePickerController, animated: true)
    }
        
    @IBAction func save(_ sender: UIButton) {
        if movie == nil {
            movie = Movie(context: context)
        }
        
        movie?.title = textFieldTitle.text
        movie?.summary = textViewSummary.text
        movie?.duration = textFieldDuration.text
        movie?.rating = Double(textFieldRating.text!) ?? 0
        movie?.image = imageViewPoster.image?.jpegData(compressionQuality: 0.8)
//        movie?.categories = ?
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        }catch {
            print(error)
        }
        
    }
}

extension MovieFormViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imageViewPoster.image = image
        }
        
        dismiss(animated: true)
    }
}
