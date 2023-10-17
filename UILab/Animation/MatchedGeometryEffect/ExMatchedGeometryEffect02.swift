//
// ExMatchedGeometryEffect02.swift
// Created on 2023/10/18
//

import SwiftUI

fileprivate enum ViewPattern {
    case A
    case B
    mutating func toggle() {
        if self == .A {
            self = .B
        } else {
            self = .A
        }
    }
}

// https://zenn.dev/yamajyn/articles/473f2ae123769d
struct ExMatchedGeometryEffect02: View {
    @Namespace private var namespace
    @State private var presentingView: ViewPattern = .A

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                if presentingView == .A {
                    Rectangle()
                        .matchedGeometryEffect(id: "rectangle", in: namespace) // matchさせたいもの同士で同じ id & namespace となるようにする
                        .foregroundColor(.red)
                        .frame(width: 100, height: 100)

                }
                // 補助用の破線
                Rectangle()
                    .stroke(style: .init(dash: [4, 2]))
                Text("A")
            }
            .frame(width: 100, height: 100)

            ZStack {
                if presentingView == .B {
                    Rectangle()
                        .matchedGeometryEffect(id: "rectangle", in: namespace) // matchさせたいもの同士で同じ id & namespace となるようにする
                        .foregroundColor(.green)
                        .frame(width: 50, height: 50)
                }
                // 補助用の破線
                Rectangle()
                    .stroke(style: .init(dash: [4, 2]))
                    .frame(width: 50, height: 50)
                Text("B")
            }
            .frame(width: 100, height: 100)
        }
        .onTapGesture {
            withAnimation(.easeOut(duration: 1)) {
                presentingView.toggle()
            }
        }
    }
}

#Preview {
    ExMatchedGeometryEffect02()
}
