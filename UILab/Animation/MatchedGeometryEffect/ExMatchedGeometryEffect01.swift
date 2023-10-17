//
// ExMatchedGeometryEffect01.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExMatchedGeometryEffect01: View {
    @Namespace private var testHero
    @State private var show = false

    var body: some View {
        VStack {
            if show {
                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.blue)
                    .matchedGeometryEffect(id: "zoom", in: testHero)
                    .ignoresSafeArea(.all)
            } else {
                Circle()
                    .frame(width: 100)
                    .foregroundColor(.green)
                    .matchedGeometryEffect(id: "zoom", in: testHero)
            }
        }
        .onTapGesture {
            withAnimation(.easeOut) {
                show.toggle()
            }
        }
    }
}

#Preview {
    ExMatchedGeometryEffect01()
}
