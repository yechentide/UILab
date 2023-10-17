//
// ExMultiBlendMode.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExMultiBlendMode: View {
    @State private var position: CGSize = .zero

    var text: some View {
        Text("One place to stack all your cards")
            .font(.system(size: 48, weight: .heavy, width: .expanded))
            .bold()
            .padding(20)
            .frame(width: 390)
    }

    var body: some View {
        ZStack {
            wallpaper
            ZStack {
                text.foregroundColor(.white)
                    .blendMode(.difference)
                    .overlay(text.blendMode(.hue))
                    .overlay(text.foregroundColor(.white).blendMode(.overlay))
                    .overlay(text.foregroundColor(.black).blendMode(.overlay))
            }
        }
    }

    var wallpaper: some View {
        Image("wallpaper3")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .offset(x: 300)
            .offset(x: position.width, y: position.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        position = value.translation
                    }
                    .onEnded { value in
                        withAnimation {
                            position = .zero
                        }
                    }
            )
    }
}

#Preview {
    ExMultiBlendMode()
}
