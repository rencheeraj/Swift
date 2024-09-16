//
//  BannerSingleView.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI
import Kingfisher

struct BannerSingleView: View {
    @State var imageUrl: String
    
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity,maxHeight: 96)
    }
}

#Preview {
    BannerSingleView(imageUrl: "")
}
