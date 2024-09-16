//
//  SearchBarView.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI

struct SearchBarView: View {
    @State private var search = ""
    var body: some View {
        HStack(){
            Image(systemName: "cart")
                .padding(.leading)
            HStack{
                TextField("", text: $search)
                    .padding()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 9, height: 9)
                    .padding(.trailing)
                    .foregroundStyle(Color.gray)
            }
            .frame(height: 24)
            .background(Color.AppBackgroundColor)
            .cornerRadius(10)
            
            CartButtonView(numberOfProducts: 1)
                .frame(width: 10, height: 10)
                .padding()
                .foregroundStyle(Color(.white))
                .cornerRadius(12)
        }
        .frame(width: .infinity,height: 56)
        .background(Color.AppGreenColor)
    }
}

#Preview {
    SearchBarView()
}
