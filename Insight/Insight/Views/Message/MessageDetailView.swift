//
//  MessageDetailView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/16.
//

import SwiftUI

struct MessageDetailView: View {
    var body: some View {
        VStack (alignment: .leading){
            ScrollView{
                MItemView (
                    avatar: "https://tvax1.sinaimg.cn/crop.0.0.512.512.1024/001RVHM6ly8gm8882el30j60e80e8aag02.jpg",
                    content: "发明一种新吃法#一人食 ···"
                )
                MeItem (
                    avatar: "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.1024/7257f3bbly8g96h0r6a7bj20u00u0jtc.jpg",
                    content: "你好，晚上一起吃饭吗，我在家等你啊 ···"
                )
                MItemView (
                    avatar: "https://tvax1.sinaimg.cn/crop.0.0.512.512.1024/001RVHM6ly8gm8882el30j60e80e8aag02.jpg",
                    content: "发明一种新吃法#一人食 ···"
                )
                MeItem (
                    avatar: "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.1024/7257f3bbly8g96h0r6a7bj20u00u0jtc.jpg",
                    content: "你好，晚上一起吃饭吗，我在家等你啊 ···"
                )
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(hex:0xeeeeee)) // 设置自定义颜色
    }
}

struct MessageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MessageDetailView()
    }
}
