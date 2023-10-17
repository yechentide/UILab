//
// SFSymbolAnimation.swift
// Created on 2023/10/18
//

import SwiftUI

struct SFSymbolAnimation: View {
    @State var isTapped = false

    var body: some View {
        VStack {
            Image(systemName: "ellipsis")
                .symbolEffect(.pulse)

            Image(systemName: "wand.and.rays")
                .symbolEffect(.variableColor.iterative.reversing)
            Image(systemName: "wand.and.rays")
                .symbolEffect(.variableColor.iterative.reversing, options: .speed(10))
            Divider()
            Image(systemName: "bell")
                .symbolEffect(.bounce, value: isTapped)
            Image(systemName: "bell")
                .symbolEffect(.bounce, options: .speed(0.5).repeat(3), value: isTapped)
            Divider()
            Image(systemName: "magnifyingglass")
                .symbolEffect(.scale.up, isActive: isTapped)
            Image(systemName: isTapped ? "pause.fill" : "play.fill")
                .contentTransition(.symbolEffect(.replace))
        }
        .font(.largeTitle)
        .foregroundStyle(.primary, .blue)
        .onTapGesture {
            isTapped.toggle()
        }
    }
}

#Preview {
    SFSymbolAnimation()
}
