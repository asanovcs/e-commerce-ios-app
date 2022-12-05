//
//  HomeView.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 02/12/2022.
//

import SwiftUI

struct HomeView: View {
    
    private var shopifyApi = ShopifyApi()
    
    var body: some View {
        VStack {
            List {
                ForEach(1..<11) { index in
                    ZStack {
                        NavigationLink(destination: SearchView()) {
                            EmptyView()
                        }
                        CategoryCardView(categoryName: "Catalog \(index)")
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
            .navigationBarTitle(Text("Shop"))
        }
        .onAppear() {
            shopifyApi.fetchCollections() { collections in
                collections.forEach { collection in
                    print("coll \(collection.title)")
                    //let products = collection.products.edges.map { $0.node }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
