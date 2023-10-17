//
// Transitions.swift
// Created on 2023/10/18
//

import SwiftUI

struct Transitions: View {
    @State var show = false

    var body: some View {
        ZStack {
            if !show {
                Text("View Transition")
                    .padding()
                    .background(Capsule().stroke())
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blue)
                    .padding()
//                    .transition(.opacity)
//                    .transition(.scale)
//                    .transition(.scale(scale: 0.1, anchor: .bottom))
//                    .transition(.slide)
//                    .transition(.move(edge: .trailing))
                    .transition(.offset(x: 400, y: 400))
                    .zIndex(1)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

#Preview {
    Transitions()
}
