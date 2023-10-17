//
// ExMetalShader01.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExMetalShader01: View {
    private let startDate = Date()

    var icon: some View {
        Image(systemName: "touchid")
            .resizable()
            .frame(width: 150, height: 150)
            .font(.system(size: 200).weight(.heavy))
    }

    var body: some View {
        ScrollView {
            icon
                .foregroundStyle(
                    ShaderLibrary.angledFill(
                        .float(30),
                        .float(10),
                        .color(.blue.opacity(0.6))
                    )
                )
            TimelineView(.animation) { context in
                icon
                    .colorEffect(ShaderLibrary.noise(.float(startDate.timeIntervalSinceNow)))
            }
            icon
                .foregroundColor(.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .colorEffect(ShaderLibrary.noise(.float(startDate.timeIntervalSinceNow)))
                        .blendMode(.overlay)
                )
            icon
                .layerEffect(ShaderLibrary.emboss(.float(1)), maxSampleOffset: .zero)
            icon
                .layerEffect(ShaderLibrary.pixellate(.float(5)), maxSampleOffset: .zero)
            icon
                .distortionEffect(ShaderLibrary.wave(.float(startDate.timeIntervalSinceNow)), maxSampleOffset: CGSize(width: 100, height: 100))
            icon
                .visualEffect { content, proxy in
                    content
                        .distortionEffect(ShaderLibrary.complexWave(
                            .float(startDate.timeIntervalSinceNow),
                            .float2(proxy.size),
                            .float(0.5),
                            .float(8),
                            .float(10)
                        ), maxSampleOffset: CGSize(width: 100, height: 100))
                }
            icon
                .colorEffect(ShaderLibrary.circleLoader(.boundingRect, .float(startDate.timeIntervalSinceNow)))
        }
    }
}

#Preview {
    ExMetalShader01()
}
