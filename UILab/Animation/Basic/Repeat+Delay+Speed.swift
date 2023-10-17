//
// Repeat+Delay+Speed.swift
// Created on 2023/10/18
//

import SwiftUI

struct Repeat_Delay_Speed: View {
    @State var appear = false

    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .frame(width: 44, height: 44)
            .rotationEffect(Angle(degrees: appear ? 360 : 0))
            .animation(
                .linear(duration: 2).repeatForever(autoreverses: false),
                value: appear
            )
            .onAppear {
                appear = true
            }
    }
}

#Preview {
    Repeat_Delay_Speed()
}
