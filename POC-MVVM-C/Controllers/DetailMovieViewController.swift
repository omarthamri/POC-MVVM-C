//
//  DetailMovieViewController.swift
//  POC-MVVM-C
//
//  Created by omar thamri on 24/11/2023.
//

import UIKit
import SDWebImage

class DetailMovieViewController: UIViewController {
    
    var viewModel: HomeViewModel!
    var movieImageView: UIImageView = {
           var movieImageView = UIImageView()
            movieImageView.round(5)
            movieImageView.contentMode = .scaleToFill
            movieImageView.translatesAutoresizingMaskIntoConstraints = false
            return movieImageView
        }()
        
        let titleLbl: UILabel = {
            let nameLbl = UILabel()
            nameLbl.textColor = UIColor(named: "TextColor")
            nameLbl.font = UIFont.boldSystemFont(ofSize: 22)
            nameLbl.translatesAutoresizingMaskIntoConstraints = false
            return nameLbl
                }()
        
        let dateLbl: UILabel = {
            let dateLbl = UILabel()
            dateLbl.textColor = UIColor(named: "TextColor")
            dateLbl.font = UIFont.systemFont(ofSize: 18)
            dateLbl.translatesAutoresizingMaskIntoConstraints = false
            return dateLbl
                }()
        
        let descriptionTextView: UITextView = {
            let descriptionTextView = UITextView()
            descriptionTextView.backgroundColor = UIColor(named: "BackgroundColor")
            descriptionTextView.textColor = UIColor(named: "TextColor")
            descriptionTextView.sizeToFit()
            descriptionTextView.font = UIFont.systemFont(ofSize: 18)
            descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
            return descriptionTextView
                }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureConstraints()
        bindViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
                view.addSubview(movieImageView)
                view.addSubview(titleLbl)
                view.addSubview(dateLbl)
                view.addSubview(descriptionTextView)
        if let row = viewModel.row {
            titleLbl.text = viewModel.movies[row].name ?? viewModel.movies[row].name ?? ""
            dateLbl.text = viewModel.movies[row].release_date ?? ""
            descriptionTextView.text = viewModel.movies[row].overview ?? ""
            if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.movies[row].backdrop_path ?? "")") {
                movieImageView.sd_setImage(with: url)
            }
        }
    }
    
    private func configureConstraints() {
        movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-90-[movieImageView(200)]-8-[titleLbl(25)]-6-[dateLbl(22)]-10-[descriptionTextView]-8-|", metrics: nil, views: ["movieImageView":movieImageView,"titleLbl":titleLbl,"dateLbl":dateLbl,"descriptionTextView":descriptionTextView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[titleLbl]-4-|", metrics: nil, views: ["titleLbl":titleLbl]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[dateLbl]-4-|", metrics: nil, views: ["dateLbl":dateLbl]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[descriptionTextView]-4-|", metrics: nil, views: ["descriptionTextView":descriptionTextView]))
    }
    
    private func bindViews() {
        
    }
    
}
