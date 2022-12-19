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

    func start() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.mainTimer = timer
            self.tick()
        }
    }

    func tick() {
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
