//
//  ContentView.swift
//  Elevator
//
//  Created by Kaique Monteiro on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var isRunning = false
    var building = Building(numberOfFloors: 10, numberOfElevators: 1)
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
            List(building.floors, id: \.number) { floor in
                FloorView(floor: floor, elevators: building.elevators.map {
                    $0.currentFloor == floor.number ? $0.targetFloors.keys.count : nil
                }.compactMap { $0 })
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
