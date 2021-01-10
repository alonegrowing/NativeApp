//
//  CommentView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/8.
//

import SwiftUI
import URLImage

struct CommentView: View {
    var nickname:String
    var avatar:String
    var timestamp:String
    var content:String
    @State var goodNum: Int
    @State var shareNum: Int
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading){
                    URLImage(url: URL(string: avatar)!, content: { image in
                        image.resizable().aspectRatio(contentMode: .fit).frame(width: 35, height: 35).shadow(radius: 3)
                            //.clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                    })
                    Spacer()
                }
                .padding(.trailing, 10)
                
                VStack(alignment: .leading){
                    HStack{
                        Text(nickname).bold()
                            .padding(.top, 1)
                            .font(.custom("KozGoPro-Regular", size: 15))
                            
                            //.padding(.bottom, 2)
                    }
                    Text(content)
                        .kerning(1) //字间距
                        .frame(minHeight: 10, alignment: .top)
                        .lineSpacing(7) // 行间距
                        //.font(Font.system(size: 17))
                        .font(.custom("KozGoPro-Regular", size: 14))
                        .padding(.top, 5)//.lineLimit(-1)
                        .padding(.bottom, 5)
                        .foregroundColor(Color(hex:0x363636))
                        .fixedSize(horizontal: false, vertical: true)
                    HStack{
                        
                        Spacer()
                        Spacer()
                        /*
                        HStack{
                            Image("comment").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20).opacity(0.4)
                            Text(String("2")).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                        }
                        */
                        Spacer()
                        HStack{
                            Image("good").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20).opacity(0.8)
                            Text("1").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                        }
                        Spacer()
                        Text(timestamp)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color.gray)
                    }
                }
            }
        }
        .lineSpacing(0)
        .padding(.leading, 15).padding(.trailing, 20).padding(.bottom, 5).padding(.top, 5)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(hex: 0xFFFFFF))
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(
            nickname: "皮卡丘",
            avatar: "https://tvax2.sinaimg.cn/crop.0.0.828.828.180/6dbbe1d8ly8glgamkvg1aj20n00n0dhi.jpg",
            timestamp: "2小时前",
            content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！",

            goodNum: 2,
            shareNum: 390132
        )
    }
}
