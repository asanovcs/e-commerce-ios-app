//
//  ShopifyStore.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 06/12/2022.
//

import Foundation

class ShopifyStore: ObservableObject {
    @Published var collections: [Collection] = []
}
