//
//  ProductModel.swift
//  FurnitureEcommerce
//
//  Created by Rencheeraj Mohan on 14/09/24.
//

import Foundation

struct ProductModel: Identifiable{
    var id = UUID()
    var name : String
    var image : String
    var description: String
    var supplier : String
    var price : Int
}

var productList = [
    ProductModel(name: "Leather Couch", image: "fn1", description: "", supplier: "IKEA", price: 350),
    ProductModel(name: "Golden Couch", image: "fn2", description: "", supplier: "Wallmart", price: 350),
    ProductModel(name: "Purple Couch", image: "fn3", description: "", supplier: "Amazon", price: 350),
    ProductModel(name: "Green Couch", image: "fn4", description: "", supplier: "Flipkart", price: 350),
    ProductModel(name: "Yellow Couch", image: "fn5", description: "", supplier: "Meesho", price: 350),
    ProductModel(name: "Blue Couch", image: "fn6", description: "", supplier: "IKEA", price: 350)
]
