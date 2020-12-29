//
//  ImageView.swift
//  Insight
//
//  Created by 徐勇 on 2020/12/29.
//

import Combine
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 280, height: 280)
        }
        .onReceive(imageLoader.dataPublisher) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "https://wx4.sinaimg.cn/mw690/006kbplagy1gkqxr43rzfj30n00n0tcm.jpg")
    }
}
