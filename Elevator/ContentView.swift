//
//  ContentView.swift
//  Elevator
//
//  Created by Kaique Monteiro on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var isRunning = false
    @ObservedObject var building = Building(numberOfFloors: 10, numberOfElevators: 1)
    var body: some View {
        VStack {
            Button(isRunning ? "Stop" : "Start") {
                if !isRunning {
                    building.start()
                } else {
                    building.stop()
                }
                isRunning = !isRunning
            }

            List(Array(building.floors.enumerated()), id: \.offset) { offset, floor in
                FloorView(floor: $building.floors[offset], elevators: building.elevators.map {
                    $0.currentFloor == floor.number ? $0.totalPassengers() : nil
                }.filter { $0 != nil })
            }
        }
    }
}
