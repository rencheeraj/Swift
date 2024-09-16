//
//  HomePageView.swift
//  FurnitureEcommerce
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top){
                Color.white
                    .ignoresSafeArea(edges: .all)
                
                VStack{
                    AppBar()
                    
                    SearchView()
                    
                    ImageSliderView()
                    
                    HStack{
                        Text("New Arrivals")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        Image(systemName: "circle.grid.2x2.fill")
                            .foregroundStyle(Color.kPrimary)
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(productList, id: \.id){product in
                                NavigationLink{} label: {
                                    ProductcardView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 80)
                
            }
        }
    }
}

#Preview {
    HomePageView()
        .environmentObject(CartManager())
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    
                    Text("Delhi, India")
                        .font(.title2)
                        .foregroundStyle(Color(.gray))
                    
                    Spacer()
                    
                    NavigationLink(destination: Text("")){
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
                Text("Find The Most \nLuxurious")
                    .font(.largeTitle .bold())
                + Text(" Furniture")
                    .font(.largeTitle .bold())
                    .foregroundStyle(Color.kPrimary)
            }
        }
        .environmentObject(CartManager())
        .padding()
    }
}
