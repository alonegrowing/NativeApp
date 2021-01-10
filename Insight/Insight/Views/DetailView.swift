//
//  DetailView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI
import URLImage

struct DetailView: View {
    var nickname:String = "Deam Suresh"
    var avatar:String = "https://wx1.sinaimg.cn/mw690/66729e4cly1gmg85lrr9hj2050050dfq.jpg"
    var timestamp:String = "2天前"
    var content:String = "她一直被爱情抛弃，当终于有天遇到了真正的爱情，她却不能好好地看清他。为什么世间的爱情总是要经过如此多的磨难？"
    var imgURL:String = "https://pic1.zhimg.com/80/v2-2f2628bc63becb39824948932f796209_720w.jpeg"
    var commentNum: Int = 21
    @State var goodNum: Int = 339398
    @State var shareNum: Int = 1921
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    HStack(){
                        URLImage(url: URL(string: avatar)!, content: { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45).shadow(radius: 3)
                                //.clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                        })
                        VStack(alignment: .leading){
                            Text(nickname).padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text(timestamp).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }.padding(.leading, 5)
                    }.frame(height: 50)
                    VStack(alignment: .leading){
                        Text(content)
                            .kerning(1) //字间距
                            .frame(minHeight: 30, alignment: .top)
                            .lineSpacing(7) // 行间距
                            //.font(Font.system(size: 17))
                            .font(.custom("KozGoPro-Regular", size: 16))
                            .padding(.top, 10)//.lineLimit(-1)
                            .padding(.bottom, 10)
                            .foregroundColor(Color(hex:0x363636))
                            .fixedSize(horizontal: false, vertical: true)
                        URLImage(url: URL(string: imgURL)!, content: { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(width: 300, height:200, alignment: .leading)
                        })
                    }
                }.frame(minWidth: 100, maxWidth: .infinity, minHeight: 44).padding(.top, 10).padding(.bottom, 5)
                HStack{
                    HStack{
                        Image("good").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20).opacity(0.8)
                        Text(String(goodNum)).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                    }
                    .onTapGesture(count: 1, perform: { //点赞事件
                        // 判断已点或者未点，再做 + 1 或者 -1 操作；目前先简单处理，每次点击直接 + 1
                        goodNum += 1
                    })
                    Spacer()
                    HStack{
                        Image("comment").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20).opacity(0.4)
                        Text(String(commentNum)).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                    }
                    Spacer()
                    HStack{
                        Image("share").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20).opacity(0.4)
                        Text(String(shareNum)).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                    }
                    Spacer()
                    Image("shenglue")
                }.padding(.top, 10)
            }
            //.lineSpacing(0)
            .padding(.leading, 17).padding(.trailing, 20).padding(.bottom, 10)
            .frame(minHeight: 300)
            .background(Color(hex:0xFFFFFF)) // 设置自定义颜色
            VStack(alignment: .leading) {
                ScrollView {
                    CommentView()
                    CommentView()
                    CommentView()
                    CommentView()
                    CommentView()
                    CommentView()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(hex:0xF9FAFA)) // 设置自定义颜色
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
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
