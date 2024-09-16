//
//  CategoryListView.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI

struct CategoryListView: View {
    @State var categories: [ContentElement]
    let sectionTitle : String
//    let buttonAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(sectionTitle)
                    .font(.headline)
                    .padding(.leading)
                
                Spacer()
                
                Text("View All")
                    .padding(.trailing)
                
//                Button(action: buttonAction) {
//                    Text("View All")
//                }
//                .padding(.trailing)
            }
            .padding(.vertical)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(categories, id: \.title) { category in
                        HStack {
                            if let imageUrl = category.imageURL {
                                AsyncImage(url: URL(string: imageUrl)) { image in
                                    image.resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            VStack(alignment: .leading) {
                                Text(category.title ?? "")
                                    .font(.headline)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: 76, maxHeight: 64)
            
        }
    }
}

#Preview {
    CategoryListView(categories: [], sectionTitle: "Category")
}

