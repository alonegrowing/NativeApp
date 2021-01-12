//
//  EditorView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/12.
//

import SwiftUI



struct EditorPublish: View {
    var body: some View {
        //Text("发布").bold().font(.custom("KozGoPro-Regular", size: 20))
        Image("publish1").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25).opacity(0.6)
    }
}

struct EditorView: View {
    @State var text = "记录书摘格言，名家语录"
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var EditorClose: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("close").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25).opacity(0.6)
            }.padding(.leading, -5)
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                TextEditor(text: self.$text)
                    // make the color of the placeholder gray
                    .foregroundColor(self.text == "记录书摘格言，名家语录" ? .gray : .primary)
                    
                    .onAppear {
                        // remove the placeholder text when keyboard appears
                        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                            withAnimation {
                                if self.text == "记录书摘格言，名家语录" {
                                    self.text = ""
                                }
                            }
                        }
                        
                        // put back the placeholder text if the user dismisses the keyboard without adding any text
                        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                            withAnimation {
                                if self.text == "" {
                                    self.text = "记录书摘格言，名家语录e"
                                }
                            }
                        }
                    }
                    .accentColor(.blue)
                    .padding(.top, 10)
                    .foregroundColor(Color.black)
                    .font(.custom("KozGoPro-Regular", size: 17))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                Spacer()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(hex:0xF9F9F9)) // 设置自定义颜色
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: EditorClose, trailing: EditorPublish())
    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        EditorView()
    }
}
