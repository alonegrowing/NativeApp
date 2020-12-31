import SwiftUI

struct FeedView : View {
    var nickName:String
    var timeStamp:String
    var content:String
    var imgName:String
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                HStack(){
                    CircleImage(imgName: "pokemon")
                    VStack(alignment: .leading){
                        Text(nickName)
                            .padding(.top, 10)
                            .padding(.bottom, 2)
                        Spacer()
                        Text(timeStamp)
                            .font(Font.system(size: 12))
                            .foregroundColor(Color.gray)
                            .padding(.bottom, 2)
                    }
                }
                .frame(height: 50)
                VStack(alignment: .leading){
                    Text(content)
                        .frame(minHeight: 50, alignment: .top)
                        .font(Font.system(size: 15))
                        .padding(.top, 20)
                        //.lineLimit(-1)
                    Image(imgName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height:200, alignment: .center)
                }
            }
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
                .padding()
            HStack{
                //Spacer()
                Image("dianzan")
                Spacer()
                Image("pinglun")
                Spacer()
                Image("share")
                Spacer()
                Image("shenglue")
            }
                .padding(.bottom, 5)
                .padding(.leading, 20)
                .padding(.top, 10)
        }
            .lineSpacing(0)
            .frame(minHeight: 300)
    }
}

struct FeedView_Previews : PreviewProvider {
    static var previews: some View {
        FeedView(nickName: "皮卡丘", timeStamp: "2小时前",content: "发明一种新吃法#一人食灌蛋手抓饼夹小油条泡菜香肠，挤上番茄酱甜面酱巨好吃呀😘！！灌蛋是灵魂，不能偷懒！！", imgName: "sucai")
    }
}
