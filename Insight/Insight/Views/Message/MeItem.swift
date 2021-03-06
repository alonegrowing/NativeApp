//
//  MeItemView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/16.
//

import SwiftUI
import URLImage

struct MeItem: View {
    var avatar:String
    var content:String
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(content)
                    .kerning(1) //字间距
                    .lineSpacing(7) // 行间距
                    .font(.custom("KozGoPro-Regular", size: 14))
                    .foregroundColor(Color(hex:0x363636))
                    .fixedSize(horizontal: false, vertical: true)
                    .shadow(radius: 3)
                    .padding(.all, 10)
            }
            .frame(maxWidth: 260, minHeight: 50, alignment: .leading)
            .background(Color(hex:0xFFFFFF)) // 设置自定义颜色
            .cornerRadius(5)
            URLImage(url: URL(string: avatar)!, content: { image in
                image.resizable().aspectRatio(contentMode: .fit).frame(width: 35, height: 35).shadow(radius: 3)
                .clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
            }).padding(.leading, 5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .padding(.trailing, 16).padding(.bottom, 0).padding(.top, 20)
    }
}

struct MeItem_Previews: PreviewProvider {
    static var previews: some View {
        MeItem(
            avatar: "https://tvax1.sinaimg.cn/crop.0.0.512.512.1024/001RVHM6ly8gm8882el30j60e80e8aag02.jpg",
            content: "发明一种新吃法#一人食 ···"
        )
    }
}
