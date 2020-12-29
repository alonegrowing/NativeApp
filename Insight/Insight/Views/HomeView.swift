//
//  HomeView.swift
//  Momo
//
//  Created by 徐勇 on 2020/12/26.
//

import SwiftUI

struct Response: Codable {
    var subjects: [Result]
}

struct Result: Codable {
    var id: String
    var titleName: String
    var cover: String

    enum CodingKeys: String, CodingKey {
        case id
        case titleName = "title"
        case cover
    }
}

struct HomeView: View {
    @State private var results = [Result]()
    var body: some View {
        NavigationView {
            List(results, id: \.id) { item in
                NavigationLink(
                    destination: DetailView(),
                    label: {
                        VStack(alignment: .leading) {
                            ImageView(withURL: "https://wx4.sinaimg.cn/mw690/006kbplagy1gkqxr43rzfj30n00n0tcm.jpg")
                            Text(item.id).font(.system(size: 15))
                        }
                        
                    }
                )
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("推荐")
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
            guard let url = URL(string: "https://movie.douban.com/j/search_subjects?type=tv&tag=%E7%83%AD%E9%97%A8&page_limit=50&page_start=0") else {
                print("Invalid URL")
                return
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                        // we have good data – go back to the main thread
                        DispatchQueue.main.async {
                            // update our UI
                            self.results = decodedResponse.subjects
                        }

                        // everything is good, so we can exit
                        return
                    }
                }
                // if we're still here it means there was a problem
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }.resume()
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
