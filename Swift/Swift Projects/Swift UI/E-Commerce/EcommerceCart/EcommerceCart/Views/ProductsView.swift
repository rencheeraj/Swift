//
//  ProductsView.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI
import Kingfisher
struct ProductsView: View {
    let sectionTitle : String
    @State var products: [ContentElement]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(sectionTitle)
                    .font(.headline)
                    .padding(.leading)
                
                Spacer()
                    
                Text("View All")
                    .padding(.trailing)

            }
            .padding(.vertical)
            
//            Color(.appGray)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(products, id: \.sku) { product in
                        ZStack(alignment: .bottomTrailing) {
                            VStack(alignment: .leading) {
                                KFImage(URL(string: product.imageURL ?? ""))
                                    .resizable()
                                    .frame(width: 63, height: 55)
                                    .cornerRadius(12)
                                Text(product.productName ?? "")
                                    .font(.headline)
                                    .foregroundStyle(Color.black)
                                    .padding(.vertical, 1)
                                Text(product.offerPrice ?? "")
                                    .foregroundStyle(Color(.gray))
                                    .font(.caption)
                                    .padding(.vertical, 0.5)
                                Text("$ \(product.actualPrice ?? "")")
                                    .foregroundStyle(Color.black)
                                    .bold()
                            }
                        }
                        .frame(width: 96, height: 152)
                        .cornerRadius(15)
                        .background(Color(.systemGray6))
                        .padding(.all, 0.5)
                    }
                }
                .padding()

            }
        }
    }
}

#Preview {
    ProductsView(sectionTitle: "Products", products: [])
}

