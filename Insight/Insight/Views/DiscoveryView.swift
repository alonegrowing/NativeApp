//
//  DiscoveryView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI
import URLImage

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
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack{
                        URLImage(url: URL(string: "https://tvax1.sinaimg.cn/crop.0.0.512.512.1024/001RVHM6ly8gm8882el30j60e80e8aag02.jpg")!, content: { image in
                            image.resizable().aspectRatio(contentMode: .fit).frame(width: 45, height: 45).shadow(radius: 3)
                            .clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 1))
                        })
                        .padding(.all, 10)
                        Spacer()
                    }
                    .padding(.leading, 12)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    .frame(width: nil, height: 70, alignment: .leading)
                    .background(Color(hex: 0xffffff))
                }
                .background(Color(hex: 0xF9FAFA))
                .padding(.top, 10)
                
                Spacer()
            }
            //.navigationTitle("推荐")
            .navigationBarTitle("附近", displayMode: .inline)
            //.navigationBarItems(leading: NearByTab())
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(hex: 0xF9FAFA))
        }
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
