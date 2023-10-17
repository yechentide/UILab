//
// ExMatchedGeometryEffect04.swift
// Created on 2023/10/18
//

import SwiftUI

// https://zenn.dev/yamajyn/articles/473f2ae123769d
fileprivate struct Card: Identifiable, Hashable {
    var icon: String
    var id = UUID()
}

fileprivate struct CardView: View {
    var card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                .frame(width: 50, height: 80)
                .shadow(color: .black.opacity(0.2), radius: 2)
            Text(card.icon)
                .font(.title2)
        }
    }
}

struct ExMatchedGeometryEffect04: View {
    @State private var selectedCards: [Card] = [Card(icon: "🤣")]
    @State private var unSelectedCards: [Card] = ["😀", "😅", "🥹", "😗", "😛"].map { Card(icon: $0) }
    @Namespace private var namespace

    var body: some View {
        VStack {
            // 場
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.yellow, style: StrokeStyle(lineWidth: 2))
                    .frame(width: 50, height: 80)
                ForEach(Array(selectedCards.enumerated()), id: \.element.id) { index, card in
                    CardView(card: card)
                        .matchedGeometryEffect(id: card.id, in: namespace)
                        .transition(.scale(scale: 1)) // フェードを無効にする
                }
            }
            // 手札
            HStack(spacing: -20) {
                ForEach(Array(unSelectedCards.enumerated()), id: \.element.id) { index, card in
                    CardView(card: card)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                if let selected = selectedCards.first {
                                    unSelectedCards[index] = selected
                                }
                                selectedCards.removeLast()
                                selectedCards.append(card)
                            }
                        }
                        .matchedGeometryEffect(id: card.id, in: namespace)
                        .transition(.scale(scale: 1)) // フェードを無効にする
                }
            }
        }
        .padding()
        .frame(width: 500, height: 500)
        .background(.green)
    }
}

#Preview {
    ExMatchedGeometryEffect04()
}
