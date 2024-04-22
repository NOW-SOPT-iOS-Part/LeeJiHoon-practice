//
//  itemModel.swift
//  Semina
//
//  Created by 이지훈 on 4/20/24.
//

import Foundation
import UIKit


struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .collection, name: "류희재1", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희재2", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희재3", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희재4", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희재5", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희재6", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희재7", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희재8", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희재9", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .collection, name: "류희재10", price: "22000원", heartIsSelected: false)
        ]
    }
}
