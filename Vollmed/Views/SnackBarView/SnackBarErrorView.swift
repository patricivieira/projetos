//
//  SnackBarErrorView.swift
//  Vollmed
//
//  Created by Patricia vieira on 09/09/25.
//

import SwiftUI

struct SnackBarErrorView: View {
    
    @Binding var isShowing: Bool
    var message: String
    
    var body: some View {
        VStack{
            Spacer()
            if isShowing{
                Text(message)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .transition(.move(edge: .bottom))
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation{
                                isShowing = false
                            }
                        }
                    }
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom , isShowing ? UIApplication.shared.getKeyWindow?.safeAreaInsets.bottom ?? 0: -100)
    }
}

#Preview {
    SnackBarErrorView(isShowing: .constant(true), message: "ops ocorreu um erro")
}
