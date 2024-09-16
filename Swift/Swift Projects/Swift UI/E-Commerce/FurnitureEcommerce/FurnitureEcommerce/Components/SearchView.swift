//
//  SearchView.swift
//  FurnitureEcommerce
//
//  Created by Rencheeraj Mohan on 14/09/24.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                TextField("Search for Furniture", text: $search)
                    .padding()
            }
            .background(Color("kSecondary"))
            .cornerRadius(12)
            
            Image(systemName: "camera")
                .padding()
                .foregroundStyle(Color(.white))
                .background(Color("kPrimary"))
                .cornerRadius(12)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchView()
}
