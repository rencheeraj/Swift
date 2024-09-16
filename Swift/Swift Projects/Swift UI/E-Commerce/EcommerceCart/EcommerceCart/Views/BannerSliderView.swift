//
//  BannerSliderView.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI
import Kingfisher
import Combine

struct BannerSliderView: View {
    @State var banners: [ContentElement]
    
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<banners.count, id: \.self) { index in
                VStack {
                    if let imageUrl = banners[index].imageURL, let url = URL(string: imageUrl) {
                        KFImage(url)
                            .resizable()
                            .placeholder {
                                ProgressView()
                            }
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 104)
                            .clipped()
                    } else {
                        Color.gray
                    }
                }
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 104)
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % banners.count
            }
        }
    }
}

#Preview {
    BannerSliderView(banners: [])
}
