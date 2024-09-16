//
//  ImageSliderView.swift
//  FurnitureEcommerce
//
//  Created by Rencheeraj Mohan on 14/09/24.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides : [String] = ["fn1","fn2","fn3","fn4","fn5","fn6"]
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing){
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: 180)
                    .scaledToFit()
                    .cornerRadius(15)
            }
            HStack{
                ForEach(0..<slides.count){ index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("kPrimary") : Color("kSecondary"))
                        .frame(width: 10, height: 10)
                }
            } .padding()
        }.padding()
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 5, repeats: true){ timer in
                    if self.currentIndex + 1 == self.slides.count{
                        self.currentIndex = 0
                    }else{
                        self.currentIndex += 1
                    }
                }
            }
    }
}

#Preview {
    ImageSliderView()
}
