//
//  Ecom.swift
//  FurnitureEcommerce
//
//  Created by Rencheeraj Mohan on 14/09/24.
//

import SwiftUI

struct Ecom: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Top Search Bar and Deals Banner
            VStack {
                HStack {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search...", text: .constant(""))
                            .padding(.leading, 10)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    
                    Spacer()
                    
                    // Notification Bell
                    Button(action: {
                        // Action for notification
                    }, label: {
                        Image(systemName: "bell")
                            .foregroundColor(.gray)
                    })
                }
                .padding()
                .frame(width: .infinity, height:  56, alignment: .top)
                
                // Deals Banner
                HStack {
                    Image("deal_image") // Replace with your image
                        .resizable()
                        .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Text("Up to 70% Discount")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Monsoon Deals")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .background(Color.green) // Background color for the header
            
            // Most Popular Products Section
            VStack {
                HStack {
                    Text("Most Popular")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        // View all action
                    }) {
                        Text("View all")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ProductCardView(imageName: "product1", title: "Lenovo Speaker", price: "৳100", discountPrice: "৳300")
                        ProductCardView(imageName: "product2", title: "Mi Backpack", price: "৳100", discountPrice: "৳300")
                        ProductCardView(imageName: "product3", title: "Motul Oil", price: "৳100", discountPrice: "৳300")
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
            
            // Categories Section
            VStack {
                HStack {
                    Text("Categories")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        // View all action
                    }) {
                        Text("View all")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        CategoryCardView(iconName: "cart", title: "Grocery & Foods")
                        CategoryCardView(iconName: "mobile", title: "Mobile & Devices")
                        CategoryCardView(iconName: "tv", title: "Consumer Electronics")
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
            
            // Featured Products Section
            VStack {
                HStack {
                    Text("Featured Products")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        // View all action
                    }) {
                        Text("View all")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ProductCardView(imageName: "product1", title: "Lenovo Speaker", price: "৳100", discountPrice: "৳300")
                        ProductCardView(imageName: "product2", title: "Mi Backpack", price: "৳100", discountPrice: "৳300")
                        ProductCardView(imageName: "product3", title: "Motul Oil", price: "৳100", discountPrice: "৳300")
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
            
            Spacer()
            
            // Bottom Tab Bar
            HStack {
                TabBarButton(imageName: "house.fill", text: "Home", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                TabBarButton(imageName: "square.grid.2x2.fill", text: "Category", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                TabBarButton(imageName: "cart.fill", text: "Cart", isSelected: selectedTab == 2) {
                    selectedTab = 2
                }
                TabBarButton(imageName: "tag.fill", text: "Offers", isSelected: selectedTab == 3) {
                    selectedTab = 3
                }
                TabBarButton(imageName: "person.fill", text: "Account", isSelected: selectedTab == 4) {
                    selectedTab = 4
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
    }
}

struct ProductCardView: View {
    var imageName: String
    var title: String
    var price: String
    var discountPrice: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text(title)
                .font(.subheadline)
                .lineLimit(1)
            
            HStack {
                Text(price)
                    .font(.headline)
                    .foregroundColor(.red)
                Text(discountPrice)
                    .font(.subheadline)
                    .strikethrough()
            }
        }
        .frame(width: 150)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct CategoryCardView: View {
    var iconName: String
    var title: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding()
            
            Text(title)
                .font(.subheadline)
        }
        .frame(width: 100, height: 120)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct TabBarButton: View {
    var imageName: String
    var text: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(isSelected ? Color.green : Color.gray)
                
                Text(text)
                    .font(.footnote)
                    .foregroundColor(isSelected ? Color.green : Color.gray)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct Ecom_Previews: PreviewProvider {
    static var previews: some View {
        Ecom()
    }
}

