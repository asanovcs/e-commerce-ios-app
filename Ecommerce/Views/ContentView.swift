//
//  ContentView.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 02/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var store = ShopifyStore()
    var shopifyApi = ShopifyApi()

    var body: some View {
            TabView {
                
                NavigationView {
                    HomeView(collections: $store.collections)
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                        .environment(\.symbolVariants, .none)
                }
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                            .environment(\.symbolVariants, .none)
                    }
                BasketView()
                    .tabItem {
                        Label("Basket", systemImage: "bag")
                            .environment(\.symbolVariants, .none)
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                            .environment(\.symbolVariants, .none)
                    }
            }
            .onAppear() {
                shopifyApi.fetchCollections() { collections in
                    store.collections = collections
                    collections.forEach { collection in
                        print("coll \(collection.title)")
                    }
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
