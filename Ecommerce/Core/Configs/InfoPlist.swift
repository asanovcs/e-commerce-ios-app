//
//  InfoPlist.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 05/12/2022.
//

import Foundation

public enum InfoPlist {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let shopifyShopName: String = {
        guard let rootURLstring = Self.infoDictionary["SHOPIFY_SHOP_NAME"] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        return rootURLstring
    }()
    
    static let shopifyApiKey: String = {
        guard let rootURLstring = Self.infoDictionary["SHOPIFY_API_KEY"] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        return rootURLstring
    }()
    
}
