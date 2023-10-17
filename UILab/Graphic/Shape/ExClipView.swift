//
// ExClipView.swift
// Created on 2023/10/18
//

import SwiftUI

extension View {
    fileprivate func reverseMask<Mask: View>(alignment: Alignment = .center,
                                 @ViewBuilder _ mask: () -> Mask) -> some View {
        self.mask {
            Rectangle()
                .overlay(alignment: alignment) {
                    mask()
                        .blendMode(.destinationOut)
                }
            // .compositingGroup() 無くても機能する
        }
    }
}

// https://dev.classmethod.jp/articles/swiftui-reverse-mask/

fileprivate struct UseShape: View {
    var body: some View {
        Image("img01")
            .resizable()
            .frame(width: 300, height: 300)
            .clipShape(Circle())
    }
}

fileprivate struct UseView: View {
    var body: some View {
        Image("img01")
            .resizable()
            .frame(width: 300, height: 300)
            .mask {
                Circle()
            }
    }
}

fileprivate struct ReverseMask: View {
    private var useZstack: some View {
        ZStack {
            Rectangle()

            Circle()
                .blendMode(.destinationOut)
        }
        .compositingGroup()
    }

    private var useOverlay: some View {
        Rectangle()
            .fill(.black)
            .overlay() {
                Circle()
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
    }

    var body: some View {
        useOverlay
    }
}

fileprivate struct UseReverseMask: View {
    var body: some View {
        Image("img01")
            .resizable()
            .frame(width: 300, height: 300)
            .mask {
                ReverseMask()
            }
    }
}

struct ExClipView: View {
    var body: some View {
        UseShape()
    }
}

#Preview {
    ExClipView()
}
