//
//  DiscoveryView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI
import URLImage
import Alamofire

struct NearByTab: View {
    var body: some View {
        HStack{
            Text("附近").bold().font(.custom("Georgia-Bold", size: 16))
        }
        .padding(.leading, -5)
    }
}

struct DiscoveryView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 16)!]
    }
    @State private var results = [Result]()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack{
                        Image("earth").resizable().aspectRatio(contentMode: .fit).frame(height: 35).shadow(radius: 3)
                        VStack(alignment: .leading){
                            Text("开启地理位置权限").padding(.top, 7).padding(.bottom, 2).font(Font.system(size: 15));
                            Spacer()
                            Text("开启地理位置权限之后将能获取到周围更多有趣的信息哦").font(Font.system(size: 11)).foregroundColor(Color.gray).padding(.bottom, 5)
                        }.padding(.all, 5)
                        Button(action: {
                            print("Button Tapped")
                        }) {
                            Text("去开启").font(.custom("KozGoPro-Regular", size: 12))
                        }
                        .frame(width: 40, height: 10, alignment: .center)
                        .foregroundColor(.orange)
                        .padding(.all, 8)
                        .background(Color.yellow)
                        .cornerRadius(5)
                        Spacer()
                    }
                    .padding(.leading, 12)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    .frame(width: nil, height: 60, alignment: .leading)
                    .background(Color(hex: 0xffffff))
                }.padding(.top, 10)
                VStack(alignment: .leading) {
                    HStack{
                        URLImage(url: URL(string: "https://tvax1.sinaimg.cn/crop.0.0.512.512.1024/001RVHM6ly8gm8882el30j60e80e8aag02.jpg")!, content: { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45).shadow(radius: 3)
                            .clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                        })
                        URLImage(url: URL(string: "https://tvax4.sinaimg.cn/crop.0.0.1080.1080.1024/7257f3bbly8g96h0r6a7bj20u00u0jtc.jpg")!, content: { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45).shadow(radius: 3)
                            .clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                        })
                        URLImage(url: URL(string: "https://tvax2.sinaimg.cn/crop.0.0.1080.1080.1024/006C8PZCly8gdiafyhol1j30u00u0jtj.jpg")!, content: { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45).shadow(radius: 3)
                            .clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                        })
                        Spacer()
                    }
                    .padding(.leading, 12)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    .frame(width: nil, height: 70, alignment: .leading)
                    .background(Color(hex: 0xffffff))
                }
                .padding(.top, 0)
                VStack {
                    ScrollView {
                        ForEach(results, id: \.id) {item in
                            NearbyFeedView(
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
                //.statusBar(hidden: true) //隐藏头部状态栏
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color(hex: 0xF9FAFA))
                //.edgesIgnoringSafeArea(.all) //利用顶部区域，视图会怼到最顶部上去
                .onAppear(perform: load)
                Spacer()
                
            }
            //.navigationTitle("推荐")
            .navigationBarTitle("附近", displayMode: .inline)
            //.navigationBarItems(leading: NearByTab())
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(hex: 0xF9FAFA))
        }
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

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
