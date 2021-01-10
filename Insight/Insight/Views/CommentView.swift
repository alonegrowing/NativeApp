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
        VStack(alignment: .leading){
            HStack(){
                VStack{
                    URLImage(url: URL(string: "https://wx1.sinaimg.cn/mw690/66729e4cly1gmg85lrr9hj2050050dfq.jpg")!, content: { image in
                        image.resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45).shadow(radius: 3)
                            //.clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                    })
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Text("空山陋室")
                            .padding(.top, 5)
                            .padding(.bottom, 2)
                        Spacer()
                    }
                    Text("2分钟")
                    .font(Font.system(size: 12))
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 2)
                    
                    Text("她一直被爱情抛弃，当终于有天遇到了真正的爱情，她却不能好好地看清他。为什么世间的爱情总是要经过如此多的磨难？")
                        .kerning(1) //字间距
                        .frame(minHeight: 30, alignment: .top)
                        .lineSpacing(7) // 行间距
                        //.font(Font.system(size: 17))
                        .font(.custom("KozGoPro-Regular", size: 16))
                        .padding(.top, 10)//.lineLimit(-1)
                        .padding(.bottom, 10)
                        .foregroundColor(Color(hex:0x363636))
                    .font(Font.system(size: 15))
                }
                
            }
        }
        .lineSpacing(0)
        .frame(minHeight: 50)
        .padding(.leading, 17).padding(.trailing, 20).padding(.bottom, 10).padding(.top, 15)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
