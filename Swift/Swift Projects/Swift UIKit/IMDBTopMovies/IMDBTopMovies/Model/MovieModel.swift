//
//  MovieModel.swift
//  IMDBTopMovies
//
//  Created by Rencheeraj Mohan on 05/09/24.
//

import Foundation

struct MovieModel: Codable{
    let rank: Int?
    let title, description, image, bigImage, thumbnail, rating, id, imdbid,imdbLink : String?
    let year : Int?
    
    
    enum CodingKeys : String, CodingKey{
        case rank, title, description, image
        case thumbnail, rating, id, imdbid, year
        case bigImage = "big_image"
        case imdbLink = "imdb_link"
    }
}
