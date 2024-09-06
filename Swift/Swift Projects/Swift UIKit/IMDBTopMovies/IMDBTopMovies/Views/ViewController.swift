//
//  ViewController.swift
//  IMDBTopMovies
//
//  Created by Rencheeraj Mohan on 05/09/24.
//

import UIKit

class ViewController: UIViewController, APIServiceDelegate {
    func didFetchMoviesSuccess(_ data: [MovieModel]) {
        print(data)
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIManager.shared.delegate = self
        APIManager.shared.fetchMovies()
    }


}

