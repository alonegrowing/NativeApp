import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("首页")
                }
                .tag(0)
         
            DiscoveryView()
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("发现")
                }
                .tag(1)
         
            MessageView()
                .tabItem {
                    Image(systemName: "video.circle.fill")
                    Text("消息")
                }
                .tag(2)
         
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("我的")
                }
                .tag(3)
        }
        .accentColor(.red)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
