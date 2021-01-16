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
                    content: "你好，晚上一起吃饭吗，我在家等你啊.#VogueMe今日推送推荐# 在看完《奇妙之城》重庆篇后，小me真的是被这座城市彻彻底底种草了[憧憬]小me还听说过一句话“重庆轻轨穿楼，重庆男人穿心”，仔细回想一下那些年我们追过的重庆男孩，这句话还真是所言非虚。【VX🔍“VogueMe”】今天就一起来感受一下，这些重庆男孩们“该死的魅力”吧"
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
