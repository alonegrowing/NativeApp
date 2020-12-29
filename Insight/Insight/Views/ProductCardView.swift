//
//  ProductCardView.swift
//  Insight
//
//  Created by 徐勇 on 2020/12/29.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(0)
            .shadow(color: Color.white.opacity(0.2), radius: 5, x: 0, y: 0)
    }
    
}

struct ProductCardView: View {
    var image: String
    var title: String
    var type: String
    var price: Double
    
    var body: some View {
        VStack{
            ForEach(1...3, id: \.self) {
                HStack(alignment: .center) {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .padding(.all, 20)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text(type)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(.gray)
                        HStack {
                            Text("$" + String.init(format: "%0.2f", price))
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .padding(.top, 8)
                        }
                    }.padding(.trailing, 10)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.green)
                .modifier(CardModifier())
                .padding(.top, 1)
            }
        }
    
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(image: "fall.leaves", title: "Autumn Soup", type: "Entree", price: 11.99)
    }
}
