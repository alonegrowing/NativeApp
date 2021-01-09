//
//  DiscoveryView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI

struct DiscoveryView: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("ユーザー名").font(.custom("KozGoPro-Regular", size: 16))
            }
            //.navigationTitle("推荐")
            .navigationBarTitle("",displayMode: .inline)
            .navigationBarItems(leading: Text("首页"), trailing: Text("发布"))
        }
        
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
