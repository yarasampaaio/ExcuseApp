//
//  ExcuseModel.swift
//  ExcuseApp
//
//  Created by Yara Vitoria on 18/10/22.
//

import Foundation
struct ExcuseModel: Codable, Equatable {
    var excuse: String
    var category: String
    init(excuse: String, category: String) {
        self.excuse = excuse
        self.category = category
    }
}
