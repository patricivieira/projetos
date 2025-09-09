//
//  CarouseltemView.swift
//  Vollmed
//
//  Created by Patricia vieira on 29/08/25.
//

import Foundation
import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    
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
        CarouselItemView(order: OrderType(id: 1, name: "", image: "banner1"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
