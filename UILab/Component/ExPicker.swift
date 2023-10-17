//
// ExPicker.swift
// Created on 2023/10/17
//

import SwiftUI

struct ExPicker: View {
    @State private var color = Color.blue
    @State private var selectedDate = Date()
    @State private var number: Int = 1

    var body: some View {
        ScrollView {
            ColorPicker("Pick color", selection: $color, supportsOpacity: false)

            DatePicker("Date", selection: $selectedDate)
            DatePicker(selection: $selectedDate) {
                Text("Select a date")
                    .font(.title3)
                    .foregroundStyle(Color.purple)
            }
            DatePicker("Range", selection: $selectedDate, in: ...Date())
            DatePicker("Time", selection: $selectedDate, displayedComponents: .hourAndMinute)
            DatePicker("Date and time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
            DatePicker("Select date", selection: $selectedDate)
                .datePickerStyle(.graphical)

            Picker("Your age", selection: $number) {
                ForEach(1...100, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.menu)
            Picker("Your age", selection: $number) {
                ForEach(1...100, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.wheel)
        }
        .padding()
    }
}

#Preview {
    ExPicker()
}
