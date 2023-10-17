//
// ThreeSlidingCircles.swift
// Created on 2023/10/18
//

import SwiftUI

struct ThreeSlidingCircles: View {
    private let timer = Timer.publish(every: 1.3, on: .main, in: .common).autoconnect()
    @State private var leftOffset: CGFloat = -150
    @State private var rightOffset: CGFloat = 150

    var circle: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 20, height: 20)
            .opacity(0.7)
            .offset(x: leftOffset)
    }

    var body: some View {
        ZStack {
            circle
                .animation(Animation.easeInOut(duration: 1), value: leftOffset)
            circle
                .animation(Animation.easeInOut(duration: 1).delay(0.2), value: leftOffset)
            circle
                .animation(Animation.easeInOut(duration: 1).delay(0.4), value: leftOffset)
        }
        .background(Color.gray.opacity(0.3))
        .onReceive(timer) { (_) in
            swap(&self.leftOffset, &self.rightOffset)
        }
    }
}

#Preview {
    ThreeSlidingCircles()
}
