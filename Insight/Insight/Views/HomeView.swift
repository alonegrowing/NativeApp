//
//  HomeView.swift
//  Insight
//
//  Created by 徐勇 on 2020/12/30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack
        {
            VStack
            {
                HStack
                {
                    
                    Spacer()
                    Text("动态").bold().padding(.trailing, 50)
                    Spacer()
                    Image("addPer").padding(.horizontal, 10)
                }
            }
            HStack{Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)}.padding(.top, 0).frame(height: 10.0)
            HStack(alignment: .center)
            {
                CircleImage(imgName: "subIcon")
                .padding(.leading, 10)
                Text("发布动态...")
                    .foregroundColor(Color.gray)
                Spacer()
            }
            HStack{Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)}.padding(.top, 0).frame(height: 10.0)
            List {
                FeedView(nickName: "皮卡丘", timeStamp: "2小时前",content: "2020年的最后一天来个巨型开箱，这期内容超级丰富，一定要耐心看完啊！也要㊗️大家新年快乐！新一年都顺顺利利～ ", imgName: "fall.leaves")
                HStack{Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255)}
                    .padding(.top, 0)
                    .frame(width: 500, height: 5.0)
                FeedView(nickName: "皮卡丘", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "love")
                FeedView(nickName: "皮卡丘", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "sucai")
                FeedView(nickName: "皮卡丘", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "sucai")
            }
            .padding(.leading, -20)
            // 隐藏list的item分割线
            //.listStyle(SidebarListStyle())
            .background(Color.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
