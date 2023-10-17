//
// ExFullScreenModal.swift
// Created on 2023/10/18
//

import SwiftUI

fileprivate struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.green
                .opacity(0.5)
                .ignoresSafeArea()
            Text("Close Modal")
        }
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ExFullScreenModal: View {
    @State private var showModal =  false

    var body: some View {
        Button(action: { showModal = true }) {
            Text("My Button")
        }
        .fullScreenCover(isPresented: $showModal) {
            ModalView()
        }
    }
}

#Preview {
    ExFullScreenModal()
}
