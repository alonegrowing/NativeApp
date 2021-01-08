//
//  HomeView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/5.
//

import SwiftUI


extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}


struct HomeView: View {
    var body: some View {
        VStack {
            ScrollView {
                FeedView(
                    nickName: "Deam Suresh",
                    avatar: "sucai",
                    timeStamp: "2小时前",
                    content: "我不知道该怎么和生活中无法再出现的人说再见，所以我学会了不回头去看、不说再见离开了",
                    imgName: "love"
                )
                FeedView(
                    nickName: "空山陋室",
                    avatar: "pokemon",
                    timeStamp: "12小时前",
                    content: "如果可以分胜负，我不知道他是否赢了，但一开始我就输了。可是输了又能怎么样？我们以我们的生活方式生活着，问心无愧。",
                    imgName: "fall.leaves"
                )
                FeedView(
                    nickName: "Deam Suresh",
                    avatar: "sucai",
                    timeStamp: "2小时前",
                    content: "我不知道该怎么和生活中无法再出现的人说再见，所以我学会了不回头去看、不说再见离开了",
                    imgName: "love"
                )
                FeedView(
                    nickName: "空山陋室",
                    avatar: "pokemon",
                    timeStamp: "12小时前",
                    content: "如果可以分胜负，我不知道他是否赢了，但一开始我就输了。可是输了又能怎么样？我们以我们的生活方式生活着，问心无愧。",
                    imgName: "fall.leaves"
                )
            }
            //List {}
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(hex:0xF9FAFA))
        .statusBar(hidden: true) //隐藏头部状态栏
        //.edgesIgnoringSafeArea(.all) //利用顶部区域，视图会怼到最顶部上去
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
