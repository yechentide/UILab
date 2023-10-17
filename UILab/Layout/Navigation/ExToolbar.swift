//
// ExToolbar.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExToolbar: View {
    var body: some View {
        NavigationStack {
            Text("My app")
            .toolbar {
                ToolbarItem {
                    Image(systemName: "person.crop.circle")
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Image(systemName: "person")
                    HStack {
                        Image(systemName: "ellipsis")
                        Divider()
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.blue)
                            .mask(Circle())
                    }
                }
            }
        }
    }
}

#Preview {
    ExToolbar()
}
