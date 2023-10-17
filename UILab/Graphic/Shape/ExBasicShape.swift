//
// ExBasicShape.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExBasicShape: View {
    var circles: some View {
        HStack {
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 44)
            Circle()
                .fill(Color.black)
                .frame(width: 44)
        }
        .frame(height: 44)
    }
    var ellipses: some View {
        HStack {
            Ellipse()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 88)
            Ellipse()
                .fill(Color.black)
                .frame(width: 88)
        }
        .frame(height: 44)
    }
    var rectangles: some View {
        HStack {
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 88)
            Rectangle()
                .foregroundColor(.black)
                .frame(width: 88)
        }
        .frame(height: 44)
    }
    var roundedRectangles: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.black, lineWidth: 2)
                .overlay(Text("Sign up").bold())
                .frame(width: 88)
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .foregroundColor(.gray.opacity(0.4))
                .overlay(Text("Sign up").bold())
                .frame(width: 88)
        }
        .frame(height: 44)
    }
    var capsules: some View {
        HStack {
            Capsule()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 100)
            Capsule()
                .fill(Color.black)
                .frame(width: 100)
        }
        .frame(height: 44)
    }

    var body: some View {
        VStack(spacing: 40) {
            circles
            ellipses
            rectangles
            roundedRectangles
            capsules
        }
    }
}

#Preview {
    ExBasicShape()
}
