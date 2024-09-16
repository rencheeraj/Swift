//
//  View.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI

extension View{
    func poppins(_ font: Poppins, _ size: CGFloat = 14) -> some View{
        self.font(.custom(font.fontName, size: size))
    }
    func monteserrat(_ font: Montserrat, _ size: CGFloat = 14) -> some View{
        self.font(.custom(font.fontName, size: size))
    }
}

/*
    Text("Hello")
        .poppins(.medium, 18)
 */
