//
//  Contents.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import Foundation

// MARK: - Content
struct Content: Codable {
    let type : String?
    let title: String?
    let contents: [ContentElement]?
    let id: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case type, title, contents, id
        case imageURL = "image_url"
    }
}

// MARK: - ContentElement
struct ContentElement: Codable {
    let title: String?
    let imageURL: String?
    let sku, productName: String?
    let productImage: String?
    let productRating: Int?
    let actualPrice, offerPrice, discount: String?

    enum CodingKeys: String, CodingKey {
        case title
        case imageURL = "image_url"
        case sku
        case productName = "product_name"
        case productImage = "product_image"
        case productRating = "product_rating"
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case discount
    }
}

typealias Contents = [Content]
