//
// ExSafariView.swift
// Created on 2023/10/18
//

import SwiftUI
import SafariServices

fileprivate struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}

struct ExSafariView: View {
    @State private var showSafari: Bool = false

    var body: some View {
        Text("Open Design+Code in Safari")
            .padding()
            .onTapGesture {
                showSafari.toggle()
            }
            .fullScreenCover(isPresented: $showSafari, content: {
                SFSafariViewWrapper(url: URL(string: "https://www.designcode.io")!)
            })
    }
}

#Preview {
    ExSafariView()
}
