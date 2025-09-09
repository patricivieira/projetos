//
//  CarouselTabView.swift
//  Vollmed
//
//  Created by Patricia vieira on 29/08/25.
//

import SwiftUI

struct CarouselTabView: View {
    let ordersMock: [iType] = [
        iType(id: 1, name: "Dog", image: "dog"),
        iType(id: 2, name: "Cat", image: "cat 1"),
        iType(id: 3, name: "Vet", image: "vet"),
    
    ]
    
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(ordersMock.indices, id: \.self) { index in
                CarouselItemView(order: ordersMock[index])
                    .tag(index)
            }
        }
        .frame(height: 300)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % ordersMock.count
            }
        }
    }
}

struct CarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselTabView()
    }
}
