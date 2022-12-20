//
//  Building.swift
//  Elevator
//
//  Created by Kaique Monteiro on 15/12/22.
//

import Foundation

class Building {
    var floors: [Floor] = []
    var elevators: [Elevator] = []
    private var mainTimer: Timer?

    init(numberOfFloors: Int, numberOfElevators: Int) {
        self.floors = (0..<numberOfFloors).map { number in Floor(number: number, people: [], elevatorCalled: false, desiredDirection: nil)}
        self.elevators = (0..<numberOfElevators).map { number in SimpleElevator(direction: nil)}
    }

    func start() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.mainTimer = timer
            self.tick()
        }
    }

    private func tick() {
        for elevator in elevators {
            elevator.updatePosition()
            elevator.load(people: floors[elevator.currentFloor].people)
        }
    }

    func stop() {
        guard let mainTimer else { return }
        mainTimer.invalidate()
    }
}
