//
//  ContentView.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .Home
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $currentTab) {
            
            HomeView()
            
            Text("Category View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Category)
            Text("Cart View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Cart)
            Text("Offers View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Offers)
            Text("Account View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Account)
        }
        .overlay(
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue){ tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                .background(Color.AppGrayColor)
            }
            ,
            alignment : .bottom
        ).ignoresSafeArea(.all, edges: .bottom)
    }
    func TabButton(tab : Tab) -> some View {
        GeometryReader{proxy in
            Button(action: {
//                withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.5))
                withAnimation(.timingCurve(0.68, -0.6, 0.32, 1.6, duration: 0.8))
                {
                    currentTab = tab
                }
            }, label: {
                VStack(spacing: 0){
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(Color.black)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack{
                                if currentTab == tab {
                                    Color.clear
                                        .background(Material.thin)
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    
                                    
                                    Text(tab.TabName)
                                        .foregroundStyle(Color(.black))
                                        .font(.footnote)
                                        .padding(.top, 50)
                                }
                            }
                        ).contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -15 : 0)
                        .scaleEffect(currentTab == tab ? 1 : 0.9)
                }
            })
        }
        .frame(height: 25)
    }
        
}
#Preview {
    ContentView()
}
enum Tab: String, CaseIterable{
    case Home = "house"
    case Category = "square.grid.3x3.topleft.filled"
    case Cart = "cart"
    case Offers = "bag"
    case Account = "person"
    
    var TabName: String {
        switch self{
        case .Home:
            return "Home"
        case .Category:
            return "Category"
        case .Cart:
            return "Cart"
        case .Offers:
            return "Offfers"
        case .Account:
            return "Account"
        }
    }
}
extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}
