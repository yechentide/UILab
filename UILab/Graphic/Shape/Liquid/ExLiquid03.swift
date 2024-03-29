//
// ExLiquid03.swift
// Created on 2023/10/18
//

import SwiftUI

fileprivate struct WaveShape: Shape {
    public let time: Double
    public let scale: Double
    public let amplitude: Double
    public let contentMode: ContentMode
    public let resolution: Double

    public enum ContentMode: String, CaseIterable, Identifiable, Sendable {
        case contain
        case overlap
        case fill

        public var id: String { rawValue }
    }

    public init(
        time: Double,
        scale: Double = 2 * .pi,
        amplitude: Double = 10,
        contentMode: ContentMode = .fill,
        resolution: Double = .pi / 12
    ) {
        self.time = time
        self.scale = scale
        self.amplitude = amplitude
        self.contentMode = contentMode
        self.resolution = resolution
    }

    var yOffset: Double {
        switch contentMode {
        case .contain:
            return 2
        case .overlap:
            return 0
        case .fill:
            return -2
        }
    }

    public func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))

            for step in stride(from: 0, to: scale, by: resolution) {
                let x = rect.maxX * (step / (scale - resolution))
                let y = amplitude * (sin(step + time)
                                     + sin(0.5 * step - 0.5 * time)
                                     + yOffset)

                path.addLine(to: CGPoint(x: x, y: y))
            }

            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
    }
}

fileprivate struct InteractivePreview: View {
    @State var speed = 1.0
    @State var scale = 2.0 * .pi
    @State var amplitude = 10.0
    @State var contentMode: WaveShape.ContentMode = .contain
    @State var resolution = .pi / 12.0

    var body: some View {
        TimelineView(.animation) { ctx in
            WaveShape(
                time: speed * ctx.date.timeIntervalSince1970,
                scale: scale,
                amplitude: amplitude,
                contentMode: contentMode,
                resolution: resolution
            )
            .border(.green)
        }
        .overlay(alignment: .bottom) {
            VStack {
                let format = FloatingPointFormatStyle<Double>
                    .number.precision(.fractionLength(2))

                HStack {
                    Text("Speed").padding(.trailing)
                    Slider(value: $speed, in: 0.1...10)
                    Text("\(speed, format: format)")
                }
                HStack {
                    Text("Scale").padding(.trailing)
                    Slider(value: $scale, in: 1...(100 * .pi))
                    Text("\(scale, format: format)")
                }
                HStack {
                    Text("Amplitude").padding(.trailing)
                    Slider(value: $amplitude, in: 1...100)
                    Text("\(amplitude, format: format)")
                }
                HStack {
                    Text("Resolution").padding(.trailing)
                    Slider(value: $resolution, in: 0.01...(10 * .pi / 12.0))
                    Text("\(resolution, format: format)")
                }
                HStack {
                    Text("Content Mode").padding(.trailing)
                    Picker("Content Mode", selection: $contentMode) {
                        ForEach(WaveShape.ContentMode.allCases) { mode in
                            Text(mode.rawValue.capitalized).tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .tint(.white)
            .foregroundColor(.white)
            .padding(.bottom, 40)
            .scenePadding()
        }
    }
}

/// https://github.com/ValentinWalter/LiquidShape/tree/main
struct ExLiquid03: View {
    let speed: Double

    init(speed: Double = 1) {
        self.speed = speed
    }

    var body: some View {
        TimelineView(.animation) { ctx in
            WaveShape(time: speed * ctx.date.timeIntervalSince1970)
        }
    }

    fileprivate static func debug() -> some View {
        InteractivePreview()
    }
}

#Preview {
//    ExLiquid03(speed: 2)
//        .previewLayout(.sizeThatFits)
//        .foregroundColor(.blue.opacity(0.5))
//        .padding(.top, 200)
//        .ignoresSafeArea()

    ExLiquid03.debug()
        .previewLayout(.sizeThatFits)
        .foregroundColor(.blue)
        .padding(.top, 200)
}
