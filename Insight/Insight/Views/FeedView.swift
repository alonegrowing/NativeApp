//
//  FeedView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/5.
//

import SwiftUI

extension Color {
    static let ReadColor = Color("ReadColor")
    static let TextColor = Color("TextColor")
 
    // ... add the rest of your colors here
}

struct FeedView: View {
    var nickName:String
    var avatar:String
    var timeStamp:String
    var content:String
    var imgName:String
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                HStack(){
                    CircleImage(imgName: avatar)
                    VStack(alignment: .leading){
                        Text(nickName).padding(.top, 7).padding(.bottom, 2);Spacer()
                        Text(timeStamp).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                    }.padding(.leading, 5)
                }.frame(height: 50)
                VStack(alignment: .leading){
                    Text(content)
                        .kerning(1) //字间距
                        .frame(minHeight: 30, alignment: .top)
                        //.font(Font.system(size: 17))
                        .lineSpacing(7) // 行间距
                        .font(.custom("KozGoPro-Regular", size: 16))
                        .padding(.top, 10)//.lineLimit(-1)
                        .padding(.bottom, 10)
                        .foregroundColor(Color(hex:0x363636))
                        
                    Image(imgName).resizable().aspectRatio(contentMode: .fit).frame(width: 300, height:200, alignment: .leading)
                }
            }.frame(minWidth: 100, maxWidth: .infinity, minHeight: 44).padding(.top, 10)
            HStack{
                //Spacer()
                Image("good")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .opacity(0.8)
                Spacer()
                Image("comment")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .opacity(0.4)
                Spacer()
                Image("share")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .opacity(0.4)
                Spacer()
                Image("shenglue")
            }.padding(.top, 10)
        }
        //.lineSpacing(0)
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .frame(minHeight: 300)
        .background(Color(hex:0xFFFFFF)) // 设置自定义颜色
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(nickName: "皮卡丘", avatar: "pokemon", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "sucai")
    }
}
