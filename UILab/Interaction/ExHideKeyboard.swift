//
// ExHideKeyboard.swift
// Created on 2023/10/18
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct ExHideKeyboard: View {
    @State private var email = ""

    var body: some View {
        VStack {
            TextField("Email address", text: $email)
            SecureField("Password", text: $email)
            Button(action: {
            }) {
                Text("Sign in")
                    .fontWeight(.semibold)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    ExHideKeyboard()
}
