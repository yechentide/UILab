//
// ExSVGShape.swift
// Created on 2023/10/18
//

import SwiftUI

fileprivate struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.68853*width, y: 0.34512*height))
        path.addCurve(to: CGPoint(x: 0.94383*width, y: 0.26137*height), control1: CGPoint(x: 0.76897*width, y: 0.17494*height), control2: CGPoint(x: 0.90264*width, y: 0.22161*height))
        path.addCurve(to: CGPoint(x: 0.86137*width, y: 0.58436*height), control1: CGPoint(x: 1.05193*width, y: 0.40806*height), control2: CGPoint(x: 0.88432*width, y: 0.5034*height))
        path.addCurve(to: CGPoint(x: 0.76495*width, y: 0.92605*height), control1: CGPoint(x: 0.83267*width, y: 0.68557*height), control2: CGPoint(x: 0.86022*width, y: 0.86763*height))
        path.addCurve(to: CGPoint(x: 0.49349*width, y: 0.74423*height), control1: CGPoint(x: 0.66968*width, y: 0.98448*height), control2: CGPoint(x: 0.5657*width, y: 0.89391*height))
        path.addCurve(to: CGPoint(x: 0.19491*width, y: 0.59547*height), control1: CGPoint(x: 0.42128*width, y: 0.59456*height), control2: CGPoint(x: 0.41041*width, y: 0.65535*height))
        path.addCurve(to: CGPoint(x: 0.10986*width, y: 0.30014*height), control1: CGPoint(x: 0.02251*width, y: 0.54757*height), control2: CGPoint(x: 0.0411*width, y: 0.36845*height))
        path.addCurve(to: CGPoint(x: 0.37931*width, y: 0.33499*height), control1: CGPoint(x: 0.17002*width, y: 0.24037*height), control2: CGPoint(x: 0.27653*width, y: 0.19812*height))
        path.addCurve(to: CGPoint(x: 0.68853*width, y: 0.34512*height), control1: CGPoint(x: 0.50778*width, y: 0.50606*height), control2: CGPoint(x: 0.59192*width, y: 0.54952*height))
        path.closeSubpath()
        return path
    }
}

struct ExSVGShape: View {
    var body: some View {
        MyCustomShape()
    }
}

#Preview {
    ExSVGShape()
}
