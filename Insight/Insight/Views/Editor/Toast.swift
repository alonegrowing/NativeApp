//
//  ToastView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/17.
//

import SwiftUI

extension View {
    func toast(isShowing: Binding<Bool>, text: Text) -> some View {
        Toast(isShowing: isShowing, presenting: { self })
    }
}

struct Toast<Presenting>: View where Presenting: View  {
    /// The binding that decides the appropriate drawing in the body.
    @Binding var isShowing: Bool
    /// The view that will be "presenting" this toast
    let presenting: () -> Presenting
    @State var text = "记录书摘格言，名家语录"
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.presenting().blur(radius: self.isShowing ? 1 : 0)
                // 蒙层
                VStack {
                    //EditorView
                    VStack(alignment: .leading) {
                        VStack {
                            HStack {
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                    self.isShowing = false
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
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                //.transition(.flipFromBottom(duration: 100))
                .transition(.slide)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }
}
