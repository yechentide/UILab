//
// ExShadow.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExShadow: View {
    var body: some View {
        VStack {
            Text("App of the day")
                .font(.title).bold()
                .foregroundColor(.white)
                .shadow(radius: 20)
        }
        .frame(width: 300, height: 400)
        .background(Color.pink)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
        .shadow(color: Color.pink.opacity(0.4), radius: 20, x: 0, y: 10)
    }
}

#Preview {
    ExShadow()
}
