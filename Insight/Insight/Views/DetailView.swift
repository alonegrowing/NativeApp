//
//  DetailView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            FeedView(
                nickname: "皮卡丘",
                avatar: "https://tvax2.sinaimg.cn/crop.0.0.828.828.180/6dbbe1d8ly8glgamkvg1aj20n00n0dhi.jpg",
                timestamp: "2小时前",
                content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！",
                imgURL: "https://wx2.sinaimg.cn/mw690/6dbbe1d8gy1gki32hbrwbj234022oqv7.jpg",
                commentNum: 216,
                goodNum: 2,
                shareNum: 390132
            )
            CommentView()
            CommentView()
            CommentView()
            CommentView()
            CommentView()
            CommentView()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
