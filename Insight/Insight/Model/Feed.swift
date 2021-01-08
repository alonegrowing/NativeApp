//
//  Feed.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/8.
//

import Foundation


struct DataResponse: Hashable, Codable {
    var code: Int
    var message: String
    var data: [Result]
}

struct Result: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var img: String
    var content: String
    var member: Member
    var interactive: Interactive
}

struct Member: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var avatar: String
}

struct Interactive: Hashable, Codable  {
    var comment_num: Int
    var good_num: Int
    var share_num: Int
}
