//
// ContentView.swift
// Created on 2023/10/18
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button {
                print("Hello iOSDev!")
            } label: {
                Text("Hello iOSDev!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
