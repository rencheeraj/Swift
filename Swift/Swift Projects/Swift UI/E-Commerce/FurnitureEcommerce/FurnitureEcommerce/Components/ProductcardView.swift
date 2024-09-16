//
//  ProductcardView.swift
//  FurnitureEcommerce
//
//  Created by Rencheeraj Mohan on 14/09/24.
//

import SwiftUI

struct ProductcardView: View {
    @EnvironmentObject var cartManager : CartManager
    var product: ProductModel
    var body: some View {
        ZStack{
            Color("kSecondary")
            ZStack(alignment: .bottomTrailing){
                VStack(alignment: .leading){
                    Image(product.image)
                        .resizable()
                        .frame(width: 175, height: 160)
                        .cornerRadius(12)
                    Text(product.name)
                        .font(.headline)
                        .foregroundStyle(Color.black)
                        .padding(.vertical,1)
                    Text(product.supplier)
                        .foregroundStyle(Color(.gray))
                        .font(.caption)
                        .padding(.vertical,0.5)
                    Text("$ \(product.price)")
                        .foregroundStyle(Color.black)
                        .bold()
                }
                
                Button{
                    cartManager.addToCart(product: product)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color("kPrimary"))
                        .padding(.trailing)
                }
            }
            
        }
        .frame(width: 185, height: 260)
        .cornerRadius(15)
    }
}

#Preview {
    ProductcardView(product: productList[0])
        .environmentObject(CartManager())
}
