//
//  HomeView.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 16/09/24.
//

import SwiftUI

struct HomeView: View {
    @State var contentList: Contents = []
    @State private var isLoading = true
    @State private var hasError = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .top){
                Color.white
                    .ignoresSafeArea()
                
                VStack{
                    SearchBarView()
                    
                    if isLoading {
                        ProgressView("Loading...")
                    } else if hasError {
                        Text("Failed to load content")
                    } else{
                        ScrollView {
                            VStack {
                                ForEach(contentList, id: \.type) { content in
                                    switch content.type {
                                    case "banner_slider":
                                        BannerSliderView(banners: content.contents ?? [])
                                    case "products":
                                        if content.title == "Best Sellers" {
                                            ProductsView(products: content.contents ?? [])
                                        } else {
                                            ProductsView(products: content.contents ?? [])
                                        }
                                        
                                    case "categories":
                                        CategoryListView(categories: content.contents ?? [], sectionTitle: content.title)
                                    case "banner_single":
                                        if let imageUrl = content.imageURL {
                                            BannerSingleView(imageUrl: imageUrl)
                                        }
                                    default:
                                        EmptyView()
//                                            .frame(maxWidth: 0, maxHeight: 0)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            fetchContent()
        }
    }
    func fetchContent() {
        ApiService.shared.fetchContent { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let content):
                    self.contentList = content
                    //                    print(self.contentList)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
}

#Preview {
    HomeView()
}
