//
//  CardView.swift
//  Insight
//
//  Created by 徐勇 on 2020/12/30.
//

import SwiftUI

struct Response: Codable {
    var code: Int
    var message: String
    var data: [Result]
}

struct Result: Codable {
    var id: Int
    var name: String
    var img: String
    var content: String
}

struct CardView: View {
    @State private var results = [Result]()
    var body: some View {
        NavigationView {
            List(results, id: \.id) { p in
                NavigationLink(
                    destination: DetailView(),
                    label: {
                        VStack {
                            ImageView(withURL: p.img)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(p.content)
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                }
                                .layoutPriority(100)
                        
                                Spacer()
                            }
                            .padding()
                        }
                    }
                )
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
            guard let url = URL(string: "http://8.131.100.215:8888/api/topics") else {
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
                            self.results = decodedResponse.data
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
