//
//  Font.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import Foundation

enum Poppins: String{
    case black, bold, thin
    
    var fontName: String{
        "Poppins-\(self.rawValue.capitalizeFirstLetter)"
    }
}

enum Montserrat: String{
    case black, bold, light
    
    var fontName: String{
        "Montserrat-\(self.rawValue.capitalizeFirstLetter)"
    }
}
