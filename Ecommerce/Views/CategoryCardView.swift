//
//  CategoryCardView.swift
//  Ecommerce
//
//  Created by Ernis Asanov on 05/12/2022.
//

import SwiftUI

struct CategoryCardView: View {
    
    var categoryName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("sample_catalog")
                .resizable()
                .scaledToFit()
            Text(categoryName)
                .font(.headline)
            Text("785 Items")
                .foregroundColor(.gray)
                .font(.caption)
            
        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(categoryName: "Catalog name")
    }
}
