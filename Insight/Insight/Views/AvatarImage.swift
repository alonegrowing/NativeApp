/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that clips an image to a circle and adds a stroke and shadow.
*/

import SwiftUI

struct AvatarImage: View {
    var imgName:String
    var body: some View {
        Image(imgName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 45, height: 45)
            //.clipShape(Circle())
            //.overlay(Circle().stroke(Color.white, lineWidth: 1))
            .shadow(radius: 3)
    }
}

struct AvatarImage_Preview: PreviewProvider {
    static var previews: some View {
        AvatarImage(imgName: "meIcon")
    }
}
