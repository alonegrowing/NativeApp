//
//  SettingCell.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/11.
//

import SwiftUI

struct SettingCell : View {
    var imageName:String
    var title:String
    var body: some View {
        VStack{
            HStack(){
                Image(imageName)
                Text(title)
                Spacer()
            }
            .padding(.top, 5)
            .frame(height: 44)
            .padding(.horizontal, 15)
            Spacer()
            Color(red: 240.0/255.0, green: 243.0/255.0, blue: 245.0/255.0)
            .frame(height: 1)
            }
            .frame(height: 50)
    }
}

#if DEBUG
struct SettingCell_Previews : PreviewProvider {
    static var previews: some View {
        SettingCell(imageName: "setting_quanzi", title: "我的圈子")
    }
}
#endif
