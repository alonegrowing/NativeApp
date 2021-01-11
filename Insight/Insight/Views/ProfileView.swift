//
//  ProfileView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI
import URLImage

struct ProfileView: View {
    var nickname:String = "空山陋室"
    var avatar:String = "https://tvax2.sinaimg.cn/crop.0.0.828.828.180/6dbbe1d8ly8glgamkvg1aj20n00n0dhi.jpg"
    var desc:String = "空山夜雨一陋室，月下对饮一壶酒."
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        URLImage(url: URL(string: avatar)!, content: { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45).shadow(radius: 3)
                                //.clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                        })
                        VStack(alignment: .leading) {
                            Text("nickname").padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text(desc).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }
                    }.frame(height: 50)
                    HStack{
                        VStack(alignment: .leading){
                            Text("2190").padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text("关注").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }
                        VStack(alignment: .leading){
                            Text("89021").padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text("喜欢").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }
                        VStack(alignment: .leading){
                            Text("12908").padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text("评论").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }
                    }.frame(height: 50)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(hex: 0xF9FAFA))
            .padding(.leading, 17).padding(.trailing, 20).padding(.bottom, 10)
            .background(Color(hex:0xFFFFFF)) // 设置自定义颜色
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
