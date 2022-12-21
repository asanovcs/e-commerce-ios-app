//
//  ShopifyApi.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 05/12/2022.
//

import Foundation
import Buy
import UIKit

class ShopifyApi {
    
    var shopDomain = InfoPlist.shopifyShopName
    var appKey = InfoPlist.shopifyApiKey
    var locale = Locale(identifier: "en-US")
    
    static let maxImageDimension = Int32(UIScreen.main.bounds.width)
    
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
    func fetchCollections(completion: @escaping ([Collection]) -> Void) {
        let query = Storefront.buildQuery { $0
            .collections(first: 25) { $0
                .edges { $0
                    .node { $0
                        .id()
                        .title()
                        .image() { $0
                            .url()
                        }
                        .products(first: 250) { $0
                            .fragmentForStandardProduct()
                        }
                    }
                }
            }
        }

        let task = client.queryGraphWith(query) { response, error in
            if let response = response {
                let collections = response.collections.edges.map {
                    Collection(id: $0.node.id.rawValue, title: $0.node.title, imageUrl: $0.node.image!.url.absoluteString, products: $0.node.products.edges)
                }
                
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
