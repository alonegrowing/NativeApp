//
//  MessageView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI


struct MessageView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 16)!]
    }
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: MessageDetailView(), label: {
                    Message(
                        nickname: "空山陋室",
                        avatar: "https://tvax1.sinaimg.cn/crop.0.0.512.512.1024/001RVHM6ly8gm8882el30j60e80e8aag02.jpg",
                        timestamp: "2020/12/31",
                        content: "发明一种新吃法#一人食 ···"
                    )
                })
                NavigationLink(destination: MessageDetailView()) {
                    Message(
                        nickname: "Angle Baby",
                        avatar: "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.1024/7257f3bbly8g96h0r6a7bj20u00u0jtc.jpg",
                        timestamp: "2020/11/12",
                        content: "在吗？我想你了 ···"
                    )
                }
                NavigationLink(destination: MessageDetailView()) {
                    Message(
                        nickname: "张根硕",
                        avatar: "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.1024/006C8PZCly8gdiafyhol1j30u00u0jtj.jpg",
                        timestamp: "2020/10/31",
                        content: "你好，晚上一起吃饭吗，我在家等你啊 ···"
                    )
                }
            }
            //.navigationTitle("推荐")
            .navigationBarTitle("消息",displayMode: .inline)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(hex:0xF9FAFA)) // 设置自定义颜色
            .padding(.leading, 0)
        }
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
