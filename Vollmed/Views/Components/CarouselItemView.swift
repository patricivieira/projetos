//
//  CarouselItemView.swift
//  Vollmed
//
//  Created by Patricia vieira on 05/07/25.
//


import SwiftUI

struct CarouselItemView: View {
    
    let order: iType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .clipped()
    }
}

struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItemView(order: iType(id: 3, name: "", image: "vet"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

