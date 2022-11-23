//
//  Item.swift
//  Eatlist
//
//  Created by JarvanSun on 2022/11/23.
//

import Foundation

struct Item: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var imageData: Data?
}

extension Item {
    static var empty: Self {
        .init(name: "")
    }
}
