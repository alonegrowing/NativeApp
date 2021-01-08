//
//  HomeView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/5.
//

import SwiftUI
import Alamofire

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

struct DataResponse: Codable {
    var code: Int
    var message: String
    var data: [Result]
}

struct Result: Codable {
    var id: Int
    var name: String
    var img: String
    var content: String
    var member: Member
    var interactive: Interactive
}

struct Member: Codable {
    var id: Int
    var name: String
    var avatar: String
}

struct Interactive: Codable  {
    var comment_num: Int
    var good_num: Int
    var share_num: Int
}

struct HomeView: View {
    @State private var results = [Result]()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(results, id: \.id) {item in
                    FeedView(
                        nickName: item.member.name,
                        avatar: item.member.avatar,
                        timeStamp: "2小时前",
                        content: item.content,
                        imgName: item.img,
                        commentNum: item.interactive.comment_num,
                        goodNum: item.interactive.good_num,
                        shareNum: item.interactive.share_num
                    )
                }
                /*
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
                )*/
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(hex:0xF9FAFA))
        .statusBar(hidden: true) //隐藏头部状态栏
        //.edgesIgnoringSafeArea(.all) //利用顶部区域，视图会怼到最顶部上去
        .onAppear(perform: load)
        
    }
    
    func load() {
    
        AF.request("http://8.131.100.215:8888/api/topics").responseDecodable(of: DataResponse.self) { response in
            debugPrint(response.value?.data[0].img ?? "")
            debugPrint(response.value?.data[0].member.name ?? "")
            debugPrint(response.value?.data[0].interactive.good_num ?? "")
            self.results = response.value!.data
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
