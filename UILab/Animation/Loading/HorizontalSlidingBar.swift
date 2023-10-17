//
// HorizontalSlidingBar.swift
// Created on 2023/10/18
//

import SwiftUI

struct HorizontalSlidingBar: View {
    @State private var shouldAnimate = false
    @State private var leftOffset: CGFloat = -150
    @State private var rightOffset: CGFloat = 150

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
            .frame(width: 80, height: 20)
            .offset(x: shouldAnimate ? rightOffset : leftOffset)
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: shouldAnimate)
            .onAppear {
                self.shouldAnimate = true
            }
    }
}

#Preview {
    HorizontalSlidingBar()
}
