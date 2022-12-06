//
//  HomeView.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 02/12/2022.
//

import SwiftUI
import Buy

struct HomeView: View {
    
    @Binding var collections: [Collection]
    
    var body: some View {
        VStack {
            List {
                ForEach($collections) { $collection in
                    ZStack {
                        NavigationLink(destination: SearchView()) {
                            EmptyView()
                        }
                        CategoryCardView(collection: collection)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
            .navigationBarTitle(Text("Shop"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(collections: .constant(Collection.sampleData))
    }
}
