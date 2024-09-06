//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Rencheeraj Mohan on 18/08/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let backgroundColor: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(.degrees(angle))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundStyle(Color.white)
            }
            .padding(.top,30)
        } .frame(width: UIScreen.main.bounds.width * 3, height: 300)
            .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "Subtitle", angle: 15, backgroundColor: .blue)
}
