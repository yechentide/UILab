//
// ExSwipe.swift
// Created on 2023/10/18
//

import SwiftUI

fileprivate struct Message: Identifiable {
    var id = UUID()
    var title: String
    var content: String
}
fileprivate let messages = [
    Message(title: "Hello", content: "Hello my friend, how have you been? I've been wondering if you'd like to meet up sometime."),
    Message(title: "50% off sales", content: "Last chance to get a hold of last season's collection, now with an additional 50% off."),
    Message(title: "Required documents", content: "Hi, please find attached the required documents."),
    Message(title: "You have 8 new followers", content: "Congrats! Since yesterday, 8 new people followed you! Log into the app to see who they are.")
]

fileprivate struct MessageRow: View {
    var message: Message

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(message.title)
                .font(.headline)
                .bold()

            Text(message.content)
                .foregroundColor(.gray)
                .lineLimit(2)
        }
    }
}

struct ExSwipe: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Inbox")
                .font(.title).bold()
                .padding(.horizontal)

            List(messages) { message in
                MessageRow(message: message)
                    .swipeActions {
                        Button {
                            print("Message deleted")
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .tint(.purple.opacity(0.3))
            }
        }
    }
}

#Preview {
    ExSwipe()
}
