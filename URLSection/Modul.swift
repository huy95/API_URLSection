//
//  Modul.swift
//  URLSection
//
//  Created by Huy on 7/21/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import Foundation
struct Item: Codable {
    var title: String
    var tags: [String]
    var answer_count: Int
    var score: Int
    var link: String
}
struct Items: Codable {
    var items: [Item]
}
