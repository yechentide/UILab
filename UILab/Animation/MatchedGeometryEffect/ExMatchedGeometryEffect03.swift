//
// ExMatchedGeometryEffect03.swift
// Created on 2023/10/18
//

import SwiftUI

// https://zenn.dev/yamajyn/articles/473f2ae123769d
fileprivate struct Segment: Identifiable, Equatable {
  let id = UUID()
  let name: String

  init(name: String) {
    self.name = name
  }
}

struct ExMatchedGeometryEffect03: View {
    @Namespace private var namespace
    @State private var selectedSegment = segments[0]

    private static let segments = [
        Segment(name: "A"),
        Segment(name: "B"),
        Segment(name: "C")
    ]

    var body: some View {
        HStack {
            ForEach(Self.segments) { segment in
                Button {
                    withAnimation(.easeInOut) {
                        selectedSegment = segment
                    }
                } label: {
                    Text(segment.name)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .matchedGeometryEffect(id: segment.id, in: namespace, isSource: true)
                .padding(2)
                .frame(width: 100, height: 30)
            }
        }
        .background(
            Capsule(style: .continuous)
                .matchedGeometryEffect(id: selectedSegment.id, in: namespace, isSource: false)
                .foregroundColor(.blue.opacity(0.2))
                .shadow(color: .black.opacity(0.2), radius: 2)
        )
        #if os(iOS)
        .background(Color(uiColor: .secondarySystemBackground))
        #endif
        .clipShape(
            RoundedRectangle(cornerRadius: .infinity, style: .continuous)
        )
//        .frame(width: 500, height: 500)
    }
}

#Preview {
    ExMatchedGeometryEffect03()
}
