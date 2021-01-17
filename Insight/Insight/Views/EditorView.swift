//
//  EditorView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/12.
//

import SwiftUI

struct EditorView: View {
    @State var text = "记录书摘格言，名家语录"
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image("close").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20).opacity(0.6)
                        }.padding(.leading, -5)
                    }.padding(.leading, 10)
                    Spacer()
                    Image("publish1").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25).opacity(0.6).padding(.trailing, 10)
                }.padding(.top, 5)
            }.background(Color(hex: 0xffffff))
            VStack(alignment: .leading) {
                TextEditor(text: self.$text)
                    // make the color of the placeholder gray
                    .foregroundColor(self.text == "记录书摘格言，名家语录" ? .gray : .primary)
                      .onTapGesture {
                        if self.text == "记录书摘格言，名家语录" {
                          self.text = ""
                        }
                      }
                    .foregroundColor(Color.black)
                    .accentColor(Color(hex: 0x000000))
                    .foregroundColor(Color.black)
                    .font(.custom("KozGoPro-Regular", size: 13))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                Spacer()
            }.padding(.top, -10)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(hex:0xF9F9F9)) // 设置自定义颜色
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        EditorView()
    }
}
