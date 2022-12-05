//
//  ShopifyApi.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 05/12/2022.
//

import Foundation
import Buy

class ShopifyApi {
    
    var shopDomain = InfoPlist.shopifyShopName
    var appKey = InfoPlist.shopifyApiKey
    var locale = Locale(identifier: "en-US")
    
    var client: Graph.Client
    
    // ----------------------------------
    //  MARK: - Init -
    //
    init() {
        client = .init(shopDomain: "deveem-e-commerce.myshopify.com", apiKey: "47c663bbd04bcd753b10c6cc6c894edd", locale: locale)
    }
    
    // ----------------------------------
    //  MARK: - Collections -
    //
    func fetchCollections(completion: @escaping ([Storefront.Collection]) -> Void) {
        let query = Storefront.buildQuery { $0
            .collections(first: 10) { $0
                .edges { $0
                    .node { $0
                        .id()
                        .title()
                        .products(first: 10) { $0
                            .edges { $0
                                .node { $0
                                    .id()
                                    .title()
                                    .productType()
                                    .description()
                                }
                            }
                        }
                    }
                }
            }
        }

        let task = client.queryGraphWith(query) { response, error in
            if let response = response {
                let collections = response.collections.edges.map { $0.node }
                completion(collections)
            } else {
                print("Query failed: \(error)")
            }
        }
        task.resume()
    }
    
    func getShopName() {
        let query = Storefront.buildQuery { $0
            .shop { $0
                .name()
            }
        }

        let task = client.queryGraphWith(query) { response, error in
            if let response = response {
                let name = response.shop.name
                print("coll \(name)")
            } else {
                print("Query failed: \(error)")
            }
        }
        task.resume()
    }
    
}
