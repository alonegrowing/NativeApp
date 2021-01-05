//
//  Article.swift
//  Insight
//
//  Created by 徐勇 on 2020/12/29.
//

import Foundation
import SwiftUI
import CoreLocation

struct Poem: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var img: String
    var content: String
}
