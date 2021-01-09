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

struct HomeView: View {
    @State private var results = [Result]()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(results, id: \.id) {item in
                    FeedView(
                        nickname: item.member.name,
                        avatar: item.member.avatar,
                        timestamp: "2小时前",
                        content: item.content,
                        imgURL: item.img,
                        commentNum: item.interactive.comment_num,
                        goodNum: item.interactive.good_num,
                        shareNum: item.interactive.share_num
                    )
                }
            }
        }
        .statusBar(hidden: true) //隐藏头部状态栏
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(hex: 0xF9FAFA))
        //.edgesIgnoringSafeArea(.all) //利用顶部区域，视图会怼到最顶部上去
        .onAppear(perform: load)
    }
    
    func load() {
        AF.request("http://8.131.100.215:8888/api/topics").responseDecodable(of: DataResponse.self) { response in
            self.results = response.value!.data
            debugPrint(response.value?.data[0].img ?? "")
            debugPrint(response.value?.data[0].member.name ?? "")
            debugPrint(response.value?.data[0].interactive.good_num ?? "")
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
