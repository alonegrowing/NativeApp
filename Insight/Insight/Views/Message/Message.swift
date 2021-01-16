//
//  MessageView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/16.
//

import SwiftUI
import URLImage

struct Message: View {
    var nickname:String
    var avatar:String
    var timestamp:String
    var content:String
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                URLImage(url: URL(string: avatar)!, content: { image in
                    image.resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45).shadow(radius: 3)
                    .clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                })
                Spacer()
            }
            .padding(.trailing, 10)
            VStack(alignment: .leading){
                HStack{
                    Text(nickname).bold().font(.custom("KozGoPro-Regular", size: 15))
                    Spacer()
                    Text(timestamp).font(.custom("KozGoPro-Regular", size: 12)).foregroundColor(Color.gray)
                }.padding(.top, 1).padding(.bottom, 2)
                Text(content)
                    .kerning(1) //字间距
                    .frame(minHeight: 10, alignment: .top)
                    .lineSpacing(7) // 行间距
                    .font(.custom("KozGoPro-Regular", size: 14))
                    .padding(.top, 5)//.lineLimit(-1)
                    .padding(.bottom, 5)
                    .foregroundColor(Color(hex:0x363636))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.leading, 0).padding(.trailing, 10).padding(.bottom, 5).padding(.top, 5)
        .frame(minHeight: 50)
        .background(Color(hex:0xFFFFFF)) // 设置自定义颜色
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message(
            nickname: "空山陋室",
            avatar: "https://tvax1.sinaimg.cn/crop.0.0.512.512.1024/001RVHM6ly8gm8882el30j60e80e8aag02.jpg",
            timestamp: "2020/12/31",
            content: "发明一种新吃法#一人食 ···"
        )
    }
}
