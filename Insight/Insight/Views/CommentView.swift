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
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading){
                    URLImage(url: URL(string: "https://wx1.sinaimg.cn/mw690/66729e4cly1gmg85lrr9hj2050050dfq.jpg")!, content: { image in
                        image.resizable().aspectRatio(contentMode: .fit).frame(width: 35, height: 35).shadow(radius: 3)
                            //.clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                    })
                    Spacer()
                }
                .padding(.trailing, 10)
                
                VStack(alignment: .leading){
                    HStack{
                        Text("空山陋室").bold()
                            .padding(.top, 1)
                            .font(.custom("KozGoPro-Regular", size: 15))
                            
                            //.padding(.bottom, 2)
                    }
                    Text("她一直被爱情抛弃，当终于有天遇到了真正的爱")
                        .kerning(1) //字间距
                        .frame(minHeight: 10, alignment: .top)
                        .lineSpacing(7) // 行间距
                        //.font(Font.system(size: 17))
                        .font(.custom("KozGoPro-Regular", size: 15))
                        .padding(.top, 5)//.lineLimit(-1)
                        .padding(.bottom, 5)
                        .foregroundColor(Color(hex:0x363636))
                        .fixedSize(horizontal: false, vertical: true)
                    HStack{
                        
                        Spacer()
                        Spacer()
                        HStack{
                            Image("comment").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20).opacity(0.4)
                            Text(String("2")).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                        }
                        Spacer()
                        HStack{
                            Image("good").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20).opacity(0.8)
                            Text("20219").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.leading, -5).padding(.top, 2)
                        }
                        Spacer()
                        Text("2分钟")
                        .font(Font.system(size: 12))
                        .foregroundColor(Color.gray)
                    }
                }
            }
        }
        .lineSpacing(0)
        .padding(.leading, 12).padding(.trailing, 20).padding(.bottom, 5).padding(.top, 5)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(hex: 0xFFFFFF))
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
