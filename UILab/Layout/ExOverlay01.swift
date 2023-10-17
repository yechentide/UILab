//
// ExOverlay01.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExOverlay01: View {
    @State private var isLoading = true
    @ViewBuilder private var loadingOverlay: some View {
        if isLoading {
            ZStack {
                Color(white: 0, opacity: 0.75)
                ProgressView().tint(.white)
            }
        }
    }

    private var a: some View {
        ZStack {
            LinearGradient(
                colors: [.orange, .red],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Text("Swift by Sundell")
                .foregroundColor(.white)
                .font(.title)
        }
    }

    private var b: some View {
        Text("Swift by Sundell")
            .foregroundColor(.black)
            .font(.title)
            .padding(35)
            .background(
                LinearGradient(
                    colors: [.orange, .red],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .frame(width: 300, height: 300)
            )
            .border(Color.blue)
            .cornerRadius(20)
    }

    private var c: some View {
        Text("Swift by Sundell")
            .font(.title)
            .padding(35)
            .background(
                LinearGradient(
                    colors: [.orange, .red],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(alignment: .topTrailing, content: {
                Image(systemName: "star")
                    .padding([.top, .trailing], 5)
            })
            .overlay(loadingOverlay)
            .foregroundColor(.white)
            .cornerRadius(20)
    }

    var body: some View {
        c
    }
}

#Preview {
    ExOverlay01()
}
