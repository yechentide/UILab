//
// ExGrid.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExGrid: View {
    var body: some View {
        Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow {
                Text("Votes")
                    .gridColumnAlignment(.trailing)
                    .gridCellColumns(2)
                Text("Rating")
            }
            GridRow {
                Text("4")
                ProgressView(value: 0.1)
                Image(systemName: "star")
            }
            GridRow {
                Text("12")
                ProgressView(value: 0.2)
                Image(systemName: "star")
            }
            Divider()
                .background(Color.red)
                .gridCellUnsizedAxes(.horizontal)
            GridRow {
                Text("4")
                ProgressView(value: 0.1).frame(maxWidth: 250)
                Circle().gridCellUnsizedAxes([.horizontal, .vertical])
            }
            GridRow {
                Text("21")
                ProgressView(value: 0.2).frame(maxWidth: 250)
                Image(systemName: "star")
            }
        }
        .padding(20)
    }
}

#Preview {
    ExGrid()
}
