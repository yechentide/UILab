//
// ScalingCircles.swift
// Created on 2023/10/18
//

import SwiftUI

struct ScalingCircles: View {
    @State private var shouldAnimate = false

    var circle: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 20, height: 20)
            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
    }

    var body: some View {
        HStack {
            circle
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(), value: shouldAnimate)
            circle
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3), value: shouldAnimate)
            circle
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6), value: shouldAnimate)
        }
        .onAppear {
            self.shouldAnimate = true
        }
    }
}

#Preview {
    ScalingCircles()
}
