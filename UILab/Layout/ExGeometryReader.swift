//
// ExGeometryReader.swift
// Created on 2023/10/18
//

import SwiftUI

/// https://qiita.com/masa7351/items/0567969f93cc88d714ac
struct ExGeometryReader: View {
    private let halfScreenWidth = UIScreen.main.bounds.width / 2
    private let magnification: CGFloat = 1.8

    var body: some View {
        VStack {
            cardList
                .background(Color.blue.opacity(0.2))
            Spacer()
            horitontalBalls
                .background(Color.blue.opacity(0.2))
        }
        .background(Color.gray.opacity(0.2))
    }

    var cardList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0...30, id: \.self) { value in
                    GeometryReader { geometry in
                        Text("カード\(value)")
                            .frame(width: 140, height: 250)
                            .background(
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(Color.blue)
                            )
                            .rotation3DEffect(
                                Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40) / -15),
                                axis: (x: 0, y: 10, 0)
                            )
                    }
                    .frame(width: 140, height: 250)
                    .background(Color.red.opacity(0.3))
                }
            }
            .padding(40)
        }
    }

    var horitontalBalls: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(0...10, id: \.self) { _ in
                    GeometryReader { geometry in
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.red)
                            .scaleEffect(
                                max(1,
                                    -abs(geometry.frame(in: .global).midX - self.halfScreenWidth) / self.halfScreenWidth * self.magnification
                                    + self.magnification
                                   )
                            )
                    }
                    .frame(width: 100, height: self.magnification * 100)
                    .background(Color.red.opacity(0.3))
                    .padding()
                    .padding(.top, 50)
                }
            }
        }
    }
}

#Preview {
    ExGeometryReader()
}
