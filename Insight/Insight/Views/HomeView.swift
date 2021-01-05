//
//  HomeView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/5.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            List {
                FeedView(nickName: "Deam Suresh", avatar: "sucai", timeStamp: "2小时前", content: "我不知道该怎么和生活中无法再出现的人说再见，所以我学会了不回头去看、不说再见离开了", imgName: "love")
                FeedView(nickName: "空山陋室", avatar: "pokemon", timeStamp: "12小时前", content: "如果可以分胜负，我不知道他是否赢了，但一开始我就输了。可是输了又能怎么样？我们以我们的生活方式生活着，问心无愧。", imgName: "fall.leaves")
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        //.background(Color.blue)
        //.edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
