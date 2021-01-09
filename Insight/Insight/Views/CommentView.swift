//
//  CommentView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/8.
//

import SwiftUI
import URLImage

struct CommentView: View {
    var body: some View {
        VStack {
            HStack {
                URLImage(url: URL(string: "https://tvax2.sinaimg.cn/crop.0.0.828.828.180/6dbbe1d8ly8glgamkvg1aj20n00n0dhi.jpg")!, content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                        //.clipShape(Circle())
                        //.overlay(Circle().stroke(Color.white, lineWidth: 1))
                        .shadow(radius: 3)
                        
                })
                VStack {
                    VStack(alignment: .leading){
                        Text("空山陋室").padding(.top, 7).padding(.bottom, 2);Spacer()
                        Text("2分钟前").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        Text("说的很有道理，让人深深的陷入了沉思")
                            .kerning(1) //字间距
                            .frame(minHeight: 30, alignment: .top)
                            .lineSpacing(7) // 行间距
                            //.font(Font.system(size: 17))
                            .font(.custom("KozGoPro-Regular", size: 16))
                            .padding(.top, 10)//.lineLimit(-1)
                            .padding(.bottom, 10)
                            .foregroundColor(Color(hex:0x363636))
                    }.padding(.leading, 5)
                }
            }
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
