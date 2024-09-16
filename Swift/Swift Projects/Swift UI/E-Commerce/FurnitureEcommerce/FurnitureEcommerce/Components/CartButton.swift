//
//  CartButton.swift
//  FurnitureEcommerce
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "bag.fill")
                .foregroundStyle(Color.black)
                .padding(5)
            if numberOfProducts > 0{
                Text("\(numberOfProducts)")
                    .font(.caption2)
                    .foregroundStyle(Color(.white))
                    .frame(width: 15, height: 15)
                    .background(Color(.green))
                    .cornerRadius(50)
            }
        }
    }
}

#Preview {
    CartButton(numberOfProducts: 1)
}
