//
// ExShareSheet.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExShareSheet: View {
    var body: some View {
        Button(action: shareButton) {
            Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.black)
        }
    }

    func shareButton() {
        let url = URL(string: "https://designcode.io")
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

        // UIApplication.shared.windows.first?   --> deprecated in iOS 15.0
        /// https://zenn.dev/paraches/articles/windows_was_depricated_in_ios15
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

#Preview {
    ExShareSheet()
}
