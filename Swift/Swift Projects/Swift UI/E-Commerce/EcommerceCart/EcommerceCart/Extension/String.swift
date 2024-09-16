//
//  String.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import Foundation

extension String {
    var capitalizeFirstLetter: String {
        if self.count == 0 { return self }
        return prefix(1).uppercased() + dropFirst()
    }
}
