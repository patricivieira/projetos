//
//  RedactedAnimationModifier.swift
//  Vollmed
//
//  Created by Patricia vieira on 09/09/25.
//
import SwiftUICore

struct RedactedAnimationModifier: ViewModifier {
    @State private var isRedacted = true
  
    func body(content: Content) -> some View {
        content
            .opacity(isRedacted ? 0 : 1)
            .onAppear{
                withAnimation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true)) {
                    self.isRedacted.toggle()
                }
            }
        
    }
}

extension View {
    func redactedAnimation() -> some View {
        modifier(RedactedAnimationModifier())
    }
}
