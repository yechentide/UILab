//
// ExLink.swift
// Created on 2023/10/17
//

import SwiftUI

struct ExLink: View {
    var body: some View {
        VStack {
            Link("Design+Code", destination: URL(string: "https://designcode.io")!)

            Link("Design+Code", destination: URL(string: "https://designcode.io")!)
                .font(.title)
                .foregroundColor(.purple)

            Link(destination: URL(string: "https://designcode.io")!) {
                Image(systemName: "link")
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .mask(Circle())
                    .foregroundColor(.white)
            }

            HStack(spacing: 5) {
                Text("You agree to our")
                Text("Terms")
                    .foregroundStyle(Color.blue)
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "https://designcode.io/terms")!)
                    }
                Text("and")
                Text("Privacy policy")
                    .foregroundStyle(Color.blue)
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "https://designcode.io/privacy")!)
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ExLink()
}
