//
//  Comment.swift
//  Insight
//
//  Created by 徐勇 on 2021/1/10.
//

import Foundation

struct CommentResponse: Hashable, Codable {
    var code: Int
    var message: String
    var data: [CommentResult]
}

struct CommentResult: Hashable, Codable, Identifiable {
    var id: Int
    var content: String
    var member: Member
    var interactive: Interactive
}
