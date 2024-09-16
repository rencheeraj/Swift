//
//  Optional.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import Foundation

extension Optional where Wrapped == String{
    var stringValue: String {
        guard let self = self else { return ""}
        return self
    }
}


/*
    var name: String?
    print(name.stringValue)
 */
