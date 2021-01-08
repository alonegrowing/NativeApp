//
//  FeedView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/5.
//

import SwiftUI
import Alamofire
import URLImage

struct FeedView: View {
    var nickname:String
    var avatar:String
    var timestamp:String
    var content:String
    var imgURL:String
    var commentNum: Int
    var goodNum: Int
    var shareNum: Int
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                HStack(){
                    //AvatarImage(imgName: avatar)
                    URLImage(url: URL(string: avatar)!, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            //.clipShape(Circle())
                            //.overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .shadow(radius: 3)
                            
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
                    URLImage(url: URL(string: imgURL)!, content: { image in
                        image
                            .resizable().aspectRatio(contentMode: .fit).frame(width: 300, height:200, alignment: .leading)
                            
                    })
                }
            }.frame(minWidth: 100, maxWidth: .infinity, minHeight: 44).padding(.top, 10)
            HStack{
                HStack{
                    Image("good")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .opacity(0.8)
                    Text(String(goodNum)).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                }
                Spacer()
                HStack{
                    Image("comment")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .opacity(0.4)
                    Text(String(commentNum)).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                }
                Spacer()
                HStack{
                    Image("share")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .opacity(0.4)
                    Text(String(shareNum)).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                }
                Spacer()
                Image("shenglue")
            }.padding(.top, 10)
        }
        //.lineSpacing(0)
        .padding(.leading, 15)
        .padding(.trailing, 20)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .frame(minHeight: 300)
        .background(Color(hex:0xFFFFFF)) // 设置自定义颜色
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(
            nickname: "皮卡丘",
            avatar: "pokemon",
            timestamp: "2小时前",
            content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！",
            imgURL: "sucai",
            commentNum: 216,
            goodNum: 2,
            shareNum: 390132
        )
    }
}
