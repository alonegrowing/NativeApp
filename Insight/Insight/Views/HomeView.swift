//
//  HomeView.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/5.
//

import SwiftUI
import Alamofire
extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

struct HomeBarItemLeading: View {
    var body: some View {
        HStack{
            Text("09").bold().font(.custom("KozGoPro-Regular", size: 20))
            Text("Jan.2021").bold().padding(.leading, -5).padding(.top, 5).font(.custom("KozGoPro-Regular", size: 15))
        }
        .padding(.leading, -5)
    }
}

/*
struct HomeBarItemTrailing: View {
    var body: some View {
        /*
        NavigationLink(destination: EditorView(), label: {
            //Text("+").bold().font(.custom("KozGoPro-Regular", size: 25))
            Image("editor").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25)
        })
        */
        Button(action: {
            print("Hours tapped!")
        }, label: {
            Image("editor").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25)
        })
        
    }
}
*/
struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
struct HomeView: View {
    init() {
        /*
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        
        UINavigationBar.appearance().backgroundColor = UIColor(white: 0xFFFFFF, alpha: 0.01)
        UINavigationBar.appearance().standardAppearance.shadowColor = .clear
        UINavigationBar.appearance().isTranslucent = true
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        */
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 17)!]
    }
    @State private var isPresented = false
    @State private var results = [Result]()
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(results, id: \.id) {item in
                        FeedView(
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
            .navigationTitle("首页")
            .navigationBarTitle("",displayMode: .inline)
            .navigationBarItems(leading: HomeBarItemLeading(), trailing: Button(action: {
                self.isPresented = true
            }, label: {
                Image("editor").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25)
            }))
            //.navigationBarHidden(true)
            /*
            .fullScreenCover(isPresented: $isPresented, content: {
                ZStack {
                    Color.black.opacity(0.5)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isPresented.toggle()
                        }
                    EditorView()
                }
                .background(BackgroundClearView())
            })
            */
            .sheet(isPresented: $isPresented, content: {
                ZStack {
                    Color.black.opacity(0.5)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isPresented.toggle()
                        }
                    EditorView()
                }
                .background(BackgroundClearView())
            })
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
