//
//  DetailView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI
import URLImage

struct DetailView: View {
    var nickname:String
    var avatar:String
    var timestamp:String
    var content:String
    var imgURL:String
    var commentNum: Int
    @State var goodNum: Int
    @State var shareNum: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                DetailMainView(
                    nickname: nickname,
                    avatar: avatar,
                    timestamp: "2小时前",
                    content: content,
                    imgURL: imgURL,
                    commentNum: commentNum,
                    goodNum: goodNum,
                    shareNum: shareNum
                )
                HStack {
                    Text("评论").bold()
                        .font(.custom("KozGoPro-Regular", size: 19))
                    Spacer()
                }
                .padding(.leading, 12)
                .padding(.bottom, 10)
                .frame(width: nil, height: 40, alignment: .leading)
                .background(Color(hex: 0xffffff))
                VStack(alignment: .leading) {
                        CommentView()
                        CommentView()
                        CommentView()
                        CommentView()
                        CommentView()
                        CommentView()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding(.top, -10)
                
            }
        }
        //.padding(.top, 30)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarItems(leading: HomeBarItemLeading(), trailing: HomeBarItemTrailing())
        .background(Color(hex:0xF9FAFA)) // 设置自定义颜色
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            nickname: "皮卡丘",
            avatar: "https://tvax2.sinaimg.cn/crop.0.0.828.828.180/6dbbe1d8ly8glgamkvg1aj20n00n0dhi.jpg",
            timestamp: "2小时前",
            content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！",
            imgURL: "https://wx2.sinaimg.cn/mw690/6dbbe1d8gy1gki32hbrwbj234022oqv7.jpg",
            commentNum: 216,
            goodNum: 2,
            shareNum: 390132
        )
    }
}
