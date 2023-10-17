//
// ExObservableModels.swift
// Created on 2023/10/17
//

import SwiftUI

@Observable
fileprivate class ExViewModel {
    var name = "John"
    var items = [1, 2, 3]
    var count: Int { items.count }
}
@Observable
fileprivate class Donut: Identifiable {
    var id = UUID()
    var name = "Strawberry"
}

struct ExObservableModels: View {
    private var model = ExViewModel()
    @State private var donutToAdd: Donut?

    var body: some View {
        ScrollView {
            Text(model.name)
            Text("Total: \(model.count)")
            Button {
                model.items.append(model.items.count + 1)
            } label: {
                Text("+++")
            }
            Button("Add Donut") {
                donutToAdd = Donut()
            }

            ForEach(model.items, id: \.self) {
                Text("\($0)")
            }
        }
        .sheet(item: $donutToAdd) { donut in
            Text(donut.name)
        }
    }
}

#Preview {
    ExObservableModels()
}
