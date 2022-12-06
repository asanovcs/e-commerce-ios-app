//
//  Collection.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 05/12/2022.
//

import Foundation
import Buy

class Collection: Identifiable {
    let id: String
    let title: String
    let imageUrl: String
    
    init(id: String, title: String, imageUrl: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
    }
    
}

extension Collection {
    static let sampleData:[Collection] = [
        Collection(id: "1", title: "Catalog1", imageUrl: "https://cdn.shopify.com/s/files/1/0686/4302/9281/collections/shutterstock_1042252666.0.jpg?v=1670230469"),
        Collection(id: "2", title: "Catalog2", imageUrl: "https://cdn.shopify.com/s/files/1/0686/4302/9281/collections/shutterstock_1042252666.0.jpg?v=1670230469"),
        Collection(id: "3", title: "Catalog3", imageUrl: "https://cdn.shopify.com/s/files/1/0686/4302/9281/collections/shutterstock_1042252666.0.jpg?v=1670230469")
    ]
}
