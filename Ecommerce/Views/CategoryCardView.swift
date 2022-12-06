//
//  CategoryCardView.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 05/12/2022.
//

import SwiftUI

struct CategoryCardView: View {
    
    var collection: Collection
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomImageView(urlString: collection.imageUrl)
                .cornerRadius(16)
            Text(collection.title)
                .font(.headline)
            Text("785 Items")
                .foregroundColor(.gray)
                .font(.caption)
            
        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(collection: Collection.sampleData[0])
    }
}
