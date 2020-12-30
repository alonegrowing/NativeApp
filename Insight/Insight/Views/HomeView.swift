//
//  HomeView.swift
//  Insight
//
//  Created by 徐勇 on 2020/12/30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Fall Collection")
                .font(.largeTitle)
            Image("fall.leaves")
                .resizable()
                .scaledToFit()
            Spacer()
        }
        //.background(Color.purple)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
