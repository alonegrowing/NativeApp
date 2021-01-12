//
//  ProfileView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI
import URLImage

struct ProfileView: View {
    init() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var nickname:String = "空山陋室"
    var avatar:String = "https://tvax3.sinaimg.cn/crop.15.0.608.608.180/006tje94ly8ggt8b2svauj30hq0gwabw.jpg"
    var desc:String = "空山夜雨一陋室，月下对饮一壶酒."
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        URLImage(url: URL(string: avatar)!, content: { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80).shadow(radius: 3)
                                .clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                        })
                        VStack(alignment: .leading) {
                            Text("空山陋室").padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text(desc).font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }.frame(height: 60, alignment: .leading)
                        .padding(.top, 10).padding(.bottom, 10).padding(.leading, 10)
                        Spacer()
                    }
                    .frame(minHeight: 80)
                    .padding(.leading, 17).padding(.trailing, 20)
                    HStack{
                        Spacer()
                        VStack(alignment: .center){
                            Text("2190").padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text("见解").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }.frame(width: 60, alignment: .center)
                        Spacer()
                        VStack(alignment: .center){
                            Text("89021").padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text("喜欢").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }.frame(width: 60, alignment: .center)
                        Spacer()
                        VStack(alignment: .center){
                            Text("378156").padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text("关注").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }.frame(width: 60, alignment: .center)
                        Spacer()
                        VStack(alignment: .center){
                            Text("291").padding(.top, 7).padding(.bottom, 2);Spacer()
                            Text("粉丝").font(Font.system(size: 12)).foregroundColor(Color.gray).padding(.bottom, 2)
                        }.frame(width: 60, alignment: .center)
                        Spacer()
                    }.frame(height: 50)
                    .padding(.leading, 17).padding(.trailing, 20).padding(.bottom, 10)
                    Spacer()
                }
                .frame(height: 150, alignment: .center)
                .background(Color(hex:0xFFFFFF)) // 设置自定义颜色
                .padding(.top, -10)
                .padding(.bottom, 5)
                Group() {
                    SettingCell(imageName: "setting_feedback", title: "意见反馈")
                    SettingCell(imageName: "setting_shoucang", title: "设置")
                }
                .background(Color.white)
                .padding(.bottom, -7)
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(hex:0xF9F9F9)) // 设置自定义颜色
            .navigationBarTitle("",displayMode: .inline)
            .padding(.top, -20)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
